import 'dart:math';

import 'package:explore/core/data/database.dart';
import 'package:explore/core/models/animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Habitat extends StatefulWidget{
  final int currentAnimalIndex;

 Habitat({@required this.currentAnimalIndex}):assert(currentAnimalIndex!=null);
  @override
  State<StatefulWidget> createState() {
    return _Habitat();
  }
  
}

class _Habitat extends State<Habitat> with TickerProviderStateMixin{
  TabController _tabController;
  AnimationController _controller;
  AnimationController _controllerB;
  Animation<double> _angle;
  Animation<double> _scale;
  Tween<double> _scaleTween;
  int a,b;
  int index=0;
  Animal _animal;

  @override
  void initState() {
     _animal = Database.animalData[widget.currentAnimalIndex];
    _tabController = new TabController(length: 2, vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controllerB = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _angle = Tween<double>(begin: 0.7 * pi, end: 0.0)
        .animate(_controller);
    _scaleTween = Tween<double>(begin: 1.0, end: 1.0);
        _scale =_scaleTween.animate(_controllerB);
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(Habitat oldWidget) {
    if (widget.currentAnimalIndex != oldWidget.currentAnimalIndex) {
      _animal = Database.animalData[widget.currentAnimalIndex];
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(animation: _controller, builder: (context,_)=>Transform.rotate(
        angle: _angle.value,
        child:Container(
      child: Column(
     children: [
       SizedBox(height: 30),
       Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),child:TabBar(controller: _tabController,indicatorColor: _animal.primaryColor,labelColor: _animal.primaryColor,unselectedLabelColor: Color.fromRGBO(134, 134, 134, 1.0),
         tabs: _animal.environment.map((e) =>  Column(
           children: <Widget>[
             Text(e.habitation.name,style: TextStyle(fontSize: 20)),
             Divider(color: Color.fromRGBO(73, 73, 73, 1.0),height: 2.0,thickness: 1.5)
           ],
         )).toList(),onTap: (index){
         this.index=index;
         _scaleTween.begin=0.0;
         _controllerB.reset();
         _controllerB.forward();
       },)),
       SizedBox(height: 50),
       Expanded(
         child: Container(
             child: AnimatedBuilder(animation: _controllerB, builder: (context,_)=>Stack(
               children: [
                Align(child:CircleAvatar(backgroundColor: _animal.tertiaryColor,radius: 110,child: CircleAvatar(backgroundColor: _animal.secondaryColor,radius: 90,child: CircleAvatar(backgroundColor: _animal.primaryColor,radius: 70,child: Text("${_animal.environment[index].percentage}%",style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1.0),fontSize: 30,fontWeight: FontWeight.bold)),),),),alignment: Alignment.topCenter),
                 Align(child:Transform.scale(scale: _scale.value,child:ImageIcon(AssetImage(_animal.environment[index].habitation.firstImage),size: 1000,color: _animal.secondaryColor)),alignment: Alignment.bottomCenter),
                 Align(child:Transform.scale(scale: _scale.value,child:ImageIcon(AssetImage(_animal.environment[index].habitation.secondImage),size: 1000,color: _animal.primaryColor)),alignment: Alignment.bottomCenter)
                 ])),constraints: BoxConstraints.expand()
       ))
    ])
    )));
  }
  
}