import 'package:explore/core/data/database.dart';
import 'package:explore/core/models/animal.dart';
import 'package:explore/ui/icons/icons.dart';
import 'package:explore/ui/screens/view.dart';
import 'package:explore/ui/widgets/pageSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'habitat.dart';



class Home extends StatefulWidget {
  final int currentAnimalIndex;
  final VoidCallback firstScreen;
  final VoidCallback lastScreen;
  Home({@required this.currentAnimalIndex,this.firstScreen,this.lastScreen}):assert(currentAnimalIndex!=null);
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}


class _Home extends State<Home> with TickerProviderStateMixin{
  int _index = 2;
  int _currentAnimalIndex;
  List<String> categories = [
    "Population", "Habitat" , "Eco"
  ];
  final List<int> _pages = [0,1,2,3,4,5,6];
  Animal _animal;
  @override
  void initState() {
    _animal = Database.animalData[widget.currentAnimalIndex];
    _currentAnimalIndex = widget.currentAnimalIndex;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    if (widget.currentAnimalIndex != oldWidget.currentAnimalIndex) {
      _currentAnimalIndex = widget.currentAnimalIndex;
      _animal = Database.animalData[_currentAnimalIndex];
    }
    super.didUpdateWidget(oldWidget);
  }




  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(elevation: 0.0,leading: IconButton(icon:Icon(CustomIcons.custom_menu,color: _animal.primaryColor,size: 20),onPressed: ()=>widget.firstScreen()),title: Text("Xplore",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),backgroundColor: Color.fromRGBO(63, 63, 63, 1.0)),
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
                  lastScreen: widget.lastScreen,
                ),
              ),
            ),
         Column(
          children: <Widget>[
           Expanded(
             child: PageView(children:[
               Global(currentAnimalIndex: _currentAnimalIndex),
               Habitat(currentAnimalIndex: _currentAnimalIndex),
               View(currentAnimalIndex: _currentAnimalIndex)],
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


