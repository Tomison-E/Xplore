import 'package:explore/core/data/database.dart';
import 'package:explore/core/models/animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global extends StatefulWidget{
  final int currentAnimalIndex;

  Global({@required this.currentAnimalIndex}):assert(currentAnimalIndex!=null);
  @override
  State<StatefulWidget> createState() {
    return _Global();
  }


}

class _Global extends State<Global> with SingleTickerProviderStateMixin{
  Animation<int> _animation;
  Tween<int> _animationVal;
  AnimationController _controller;
  final List<int> years = [
    0,0,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994
  ];
  Animal _animal;
  @override
  void initState() {
    _animal = Database.animalData[widget.currentAnimalIndex];
    _controller =  AnimationController(
        duration:  Duration(seconds: 45),
        vsync: this
    );
    _animationVal =  IntTween(begin: 1, end: 18);
    _animation = _animationVal.animate(
        CurvedAnimation(
          parent: _controller,
          curve:  Interval(0.2, 1.0,curve: Curves.linear),
          reverseCurve: Curves.linear,
        ));
    _controller.repeat();
    super.initState();
  }

  @override
  void didUpdateWidget(Global oldWidget) {
    if (widget.currentAnimalIndex != oldWidget.currentAnimalIndex) {
      _animal = Database.animalData[widget.currentAnimalIndex];
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        child:AnimatedBuilder(animation: _controller, builder: (context,_)=>Column(
      children: <Widget>[
        SizedBox(height: 15),
        Text("${_animal.population[_animation.value]}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white)),
        SizedBox(height: 30.0),
        Expanded(child:
          Column(children:[
          Expanded(child:  SizedBox.expand(
          child:ImageIcon(AssetImage("assets/globe/globe-${_animation.value}.png"),color: _animal.primaryColor))),
           Row(
            children: <Widget>[
              Flexible(child: Text("${years[_animation.value+3]}\n\n",style: TextStyle(color: Color.fromRGBO(79, 79, 79, 1.0),fontSize: 15),textAlign: TextAlign.center),fit: FlexFit.tight),
              Flexible(child: Text("${years[_animation.value+2]}\n",style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1.0),fontSize: 20),textAlign: TextAlign.center),fit: FlexFit.tight),
              Flexible(child: Text("${years[_animation.value+1]}",style: TextStyle(color: _animal.primaryColor,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center),fit: FlexFit.tight),
              Flexible(child: Text("${years[_animation.value]==0?"":years[_animation.value]}\n",style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1.0),fontSize: 20),textAlign: TextAlign.center),fit: FlexFit.tight),
              Flexible(child: Text("${years[_animation.value-1]==0?"":years[_animation.value-1]}\n\n",style: TextStyle(color: Color.fromRGBO(79, 79, 79, 1.0),fontSize: 15),textAlign: TextAlign.center),fit: FlexFit.tight),
            ],mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],mainAxisAlignment: MainAxisAlignment.start)),

        SizedBox(height: 20),
      ],mainAxisAlignment: MainAxisAlignment.start,
        )));
  }

}

