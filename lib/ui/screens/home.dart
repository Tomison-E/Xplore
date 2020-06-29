import 'package:explore/core/data/database.dart';
import 'package:explore/core/models/animal.dart';
import 'package:explore/ui/icons/icons.dart';
import 'package:explore/ui/screens/intro.dart';
import 'package:explore/ui/screens/view.dart';
import 'package:explore/ui/widgets/pageSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'habitat.dart';



class Home extends StatefulWidget {
  final int currentAnimalIndex;

  Home({@required this.currentAnimalIndex}):assert(currentAnimalIndex!=null);
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}


class _Home extends State<Home> with TickerProviderStateMixin{
  int _index = 2;
  List<String> categories = [
    "Population", "Habitat" , "Eco"
  ];
  final List<int> _pages = [0,1,2,3,4,5,6];
  Animal _animal;
  @override
  void initState() {
    _animal = Database.animalData[widget.currentAnimalIndex];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(elevation: 0.0,leading: IconButton(icon:Icon(CustomIcons.custom_menu,color: _animal.primaryColor,size: 20),onPressed: ()=>Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context)=>Intro()), (route) => false)),title: Text("XPLORE",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),backgroundColor: Color.fromRGBO(63, 63, 63, 1.0)),
      body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionalTranslation(
                translation: Offset(0.0, 0.65),
                child: PageSelector(
                  screenSize: screenSize,
                  pages: _pages,
                  index: _index,
                  color: _animal.primaryColor,
                ),
              ),
            ),
         Column(
          children: <Widget>[
           Expanded(
             child: PageView(children:[
               Global(currentAnimalIndex: widget.currentAnimalIndex),
               Habitat(currentAnimalIndex: widget.currentAnimalIndex),
               View(currentAnimalIndex: widget.currentAnimalIndex)],
             onPageChanged: (int page){
               if(page+2> _index){
                 _index++;
                 setState(() {});
               }
               else{
                 _index--;
                 setState(() {});
               }
             })
           ),
              SizedBox(
              height: 170,
        ),
       ]
       // physics: NeverScrollableScrollPhysics(),
      ),]),
      backgroundColor: Color.fromRGBO(63, 63, 63, 1.0),
    );
  }

  
}


