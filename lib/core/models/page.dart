/*

import 'dart:math';

import 'package:explore/utils/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'habitat.dart';



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}


class _Home extends State<Home> with TickerProviderStateMixin{
  List<NavigationSphere> panel;
  int index = 0;
  List<String> categories = [
    "Population", "Habitat" , "Eco"
  ];
  int a = 2;
  int b = 3;
  int c = 4;
  int d = 5;
  AnimationController _controller;
  Animation<double> _animation;
  Tween<double> _animationVal;
  Animation<double> _animations;
  Tween<double> _animationVals;
  Animation<double> _animationF;
  Tween<double> _animationValF;
  Animation<int> _animationA;
  Tween<int> _animationValA;
  Animation<int> _animationB;
  Tween<int> _animationValB;
  Animation<int> _animationC;
  Tween<int> _animationValC;
  Animation<int> _animationD;
  Tween<int> _animationValD;

  @override
  void initState() {
    _controller =  AnimationController(
        duration:  Duration(milliseconds: 150),
        vsync: this
    );
    _animationVal =  Tween(begin: 8.0, end: 8.0);
    _animation = _animationVal.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.3, 0.5,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationValF =  Tween(begin: 0.0, end: 1.0);
    _animationF = _animationValF.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.0, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationVals =  Tween(begin: 6.0, end: 6.0);
    _animations = _animationVals.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.1, 0.2,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationValA =  IntTween(begin: a, end: 1);
    _animationA = _animationValA.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.5, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationValB =  IntTween(begin: b, end: a);
    _animationB = _animationValB.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.5, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationValC =  IntTween(begin: c, end: b);
    _animationC = _animationValC.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.5, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _animationValD =  IntTween(begin: d, end: c);
    _animationD = _animationValD.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.5, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void reload(){
    _animationValA.begin =  _animationValA.end;
    _animationValA.end = a;
    _animationValB.begin =  _animationValB.end;
    _animationValB.end = b;
    _animationValC.begin =  _animationValC.end;
    _animationValC.end = c;
    _animationValD.begin =  _animationValD.end;
    _animationValD.end = d;
    _animationVal.begin = 6.0;
    _animationVal.end = 8.0;
    _animationVals.begin = 8.0;
    _animationVals.end = 6.0;
    _animationValF.begin=0.0;
    _animationValF.end=a * pi;
  }


  @override
  Widget build(BuildContext context) {
    panel = [
      NavigationSphere(size: 6.0,left: 10,top: 150,right:0),
      NavigationSphere(size: 6.0,left: 28,top: 70,right:null),
      NavigationSphere(size: 8.0,left:SizeConfig.blockSizeHorizontal*48.5,right: null,top: null),
      NavigationSphere(size: 6.0,right: 28,top: 70,left:null),
      NavigationSphere(size: 6.0,left: 0,top: 150,right:10),
      NavigationSphere(size: 6.0,left: 0,top: 150,right:10),
    ];
    return Scaffold(
      appBar:  AppBar(elevation: 0.0,leading: ImageIcon(AssetImage("assets/icons/hamb-menu.png"),color: Color.fromRGBO(255, 0, 255, 1.0),size: 50),title: Text("WORLD",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),backgroundColor: Color.fromRGBO(63, 63, 63, 1.0)),
      body: Column(
          children: <Widget>[
            Expanded(
                child: PageView(children:[
                  Global(),
                  Habitat(),
                  Placeholder()],
                  onPageChanged: (int page){
                    if(page > index){
                      --a;--b;--c;--d;
                    }else{
                      ++a;++b;++c;++d;
                    }
                    index = page;
                    reload();
                    _controller.reset();
                    _controller.forward();
                  },)
            ),
            SizedBox(
                height: 170,
                child: AnimatedBuilder(animation: _controller, builder: (context,_)=>Column(
                    children:[
                      Text(categories[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
                      SizedBox(height: 15),
                      Stack(
                          children: <Widget>[
                            SizedBox(height: 120,width: double.infinity),
                            Positioned(child: Transform.rotate(angle: _animationF.value,child:
                            Container(child: Text(" ",style: TextStyle(color: Color.fromRGBO(73, 73, 73, 1.0),fontSize: 13)),height: 500,width: 500,
                                decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(73, 73, 73, 1.0),width:index%2!=0?2.0:1.0),shape: BoxShape.circle),alignment: Alignment.centerLeft
                            )),left: -50,top: 5,right: -50,),
                            Positioned(child: index==0?Container(

                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 12,
                              width: 6,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 0, 255, 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ):CircleAvatar(radius: index==0?_animation.value:_animations.value,backgroundColor: index==0?Color.fromRGBO(255, 0, 255, 1.0):Color.fromRGBO(255, 78, 255, 1.0)),left: panel[_animationA.value].left,top: panel[_animationA.value].top,right:panel[_animationA.value].right),
                            Positioned(child: index==1?Container(

                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 12,
                              width: 6,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 0, 255, 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ):CircleAvatar(radius: index==1?_animation.value:_animations.value,backgroundColor: index==1?Color.fromRGBO(255, 0, 255, 1.0):Color.fromRGBO(255, 78, 255, 1.0)),left: panel[_animationB.value].left,top: panel[_animationB.value].top,right:panel[_animationB.value].right,),
                            Positioned(child: index==2?Container(

                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 12,
                              width: 6,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 0, 255, 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ):CircleAvatar(radius: index==2?_animation.value:_animations.value,backgroundColor: index==2?Color.fromRGBO(255, 0, 255, 1.0):Color.fromRGBO(255, 78, 255, 1.0)),left: panel[_animationC.value].left,top: panel[_animationC.value].top,right:panel[_animationC.value].right,),
                            Positioned(child: index==3?Container(

                              margin: EdgeInsets.symmetric(horizontal: 8),
                              height: 12,
                              width: 6,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 0, 255, 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                            ):CircleAvatar(radius: index==3?_animation.value:_animations.value,backgroundColor: index==3?Color.fromRGBO(255, 0, 255, 1.0):Color.fromRGBO(255, 78, 255, 1.0)),left: panel[_animationD.value].left,top: panel[_animationD.value].top,right:panel[_animationD.value].right),
                          ])],mainAxisAlignment: MainAxisAlignment.end))
            ),
          ]
        // physics: NeverScrollableScrollPhysics(),
      ),
      backgroundColor: Color.fromRGBO(63, 63, 63, 1.0),
    );
  }


}

class NavigationSphere{

  double size;
  final double left;
  final double right;
  final double top;

  NavigationSphere({this.size,this.left,this.right,this.top});
}

*/
