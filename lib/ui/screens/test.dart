/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Habitat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Habitat();
  }

}

class _Habitat extends State<Habitat> with TickerProviderStateMixin{
  TabController _tabController;
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new SlideTransition(
        position: _offsetFloat,
        child:Container(
            child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),child:TabBar(controller: _tabController,indicatorColor: Color.fromRGBO(255, 0, 255, 1.0),labelColor: Color.fromRGBO(255, 0, 255, 1.0),unselectedLabelColor: Color.fromRGBO(73, 73, 73, 1.0),tabs: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("GRASSLAND",style: TextStyle(fontSize: 20)),
                        Divider(color: Color.fromRGBO(73, 73, 73, 1.0),height: 2.0,thickness: 1.5)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("FOREST",style: TextStyle(fontSize: 20)),
                        Divider(color: Color.fromRGBO(73, 73, 73, 1.0),height: 2.0,thickness: 1.5)
                      ],
                    )
                  ],)),
                  SizedBox(height: 50),
                  Expanded(
                      child: Align(child:CircleAvatar(backgroundColor: Color.fromRGBO(82, 51, 82, 1.0),radius: 110,child: CircleAvatar(backgroundColor: Color.fromRGBO(125, 46, 125, 1.0),radius: 90,child: CircleAvatar(backgroundColor: Color.fromRGBO(255, 0, 255, 1.0),radius: 70,child: Text("55%",style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1.0),fontSize: 30,fontWeight: FontWeight.bold)),),),),alignment: Alignment.topCenter)
                  )
                ])
        ));
  }

}*/
