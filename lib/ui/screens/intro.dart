import 'package:explore/ui/screens/donate.dart';
import 'package:explore/utils/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:explore/core/models/animal.dart';
import 'package:explore/core/data/database.dart';
import 'home.dart';
import 'package:explore/ui/icons/icons.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Intro();
  }
}

  class _Intro extends State<Intro> with SingleTickerProviderStateMixin{
  int index = 0;
  ScrollController _sc;
  List<Animal> _animals;

  @override
  void initState() {
    _sc =ScrollController();
    _animals = Database.animalData;
    super.initState();
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  void moveToFirstScreen(){
    _sc.animateTo(0.0,duration: Duration(milliseconds: 1000),curve: Curves.easeIn);
  }
  void moveToSecondScreen(){
    _sc.animateTo(SizeConfig.blockSizeVertical*100,duration: Duration(milliseconds: 1000),curve: Curves.easeIn);
  }
  void moveTolastScreen(){
    _sc.animateTo(SizeConfig.blockSizeVertical*200,duration: Duration(milliseconds: 1000),curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
        child:Column(
        children:[
         SizedBox(
        child:Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Stack(
          children: [
            Container(
            child:PageView(
              children: _animals.map((animal) => Container(
                  decoration: BoxDecoration(color: animal.primaryColor,image: DecorationImage(image: AssetImage(animal.image),alignment: Alignment.centerRight,fit: BoxFit.fitWidth))),
                ).toList(),
              onPageChanged: (a){
                setState(() {
                  index = a;
                });
              }
                )),
                Positioned(left: 10,child:Icon(CustomIcons.custom_menu,color: Colors.white,size: 20,),top: 50),
                Positioned(left: 10,bottom: 10,child: DotsIndicator(
                dotsCount: _animals.length,
                position: index.toDouble(),
                decorator: DotsDecorator(
                size: const Size.square(6.0),
                activeSize: const Size(15.0, 6.0),
                color: Colors.white70,
                activeColor: Colors.white,
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
                ))
                ]),flex: 7,
                ),
                Flexible(
                child: Container(
                color: Colors.white,child: Column(
             children:[
               Text("EXPLORE",style: TextStyle(color: Color.fromRGBO(132, 130, 140, 1.0),fontSize: 20,letterSpacing: 5.0),),
               Text(_animals[index].name,style: TextStyle(color: Color.fromRGBO(67, 69, 80, 1.0),fontSize: 50,fontWeight: FontWeight.bold)),
               IconButton(icon:Icon(CustomIcons.arrow_down,size: 35,color: Color.fromRGBO(132, 130, 140, 1.0)),onPressed: ()=>moveToSecondScreen())
            ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),constraints: BoxConstraints.expand(),
            ),flex: 3,fit: FlexFit.tight,
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(250 , 222, 95, 1.0),
    ),height: SizeConfig.blockSizeVertical*100),
    SizedBox(
    child:
    Home(currentAnimalIndex: index,firstScreen: moveToFirstScreen,lastScreen: moveTolastScreen),
        height: SizeConfig.blockSizeVertical*100),
    SizedBox(
              child:
              Donate(currentAnimalIndex: index,secondScreen: moveToSecondScreen),
              height: SizeConfig.blockSizeVertical*100)
    ]),physics: NeverScrollableScrollPhysics(),controller: _sc,);
  }



}