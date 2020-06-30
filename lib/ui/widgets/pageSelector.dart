import 'dart:math';

import 'package:flutter/material.dart';
import 'package:explore/ui/widgets/pageWidget.dart';

class PageSelector extends StatefulWidget {
  final List<int> pages;
  final int index;
  final Color color;
  final VoidCallback lastScreen;
  const PageSelector({
    Key key,
    this.pages,
    this.index,
    this.color,
    @required this.screenSize,
    this.lastScreen
  }) : super(key: key);

  final Size screenSize;

  @override
  PageSelectorState createState() {
    return PageSelectorState();
  }
}

class PageSelectorState extends State<PageSelector>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _rotationTween;
  List<String> categories = [
    "Population", "Habitat" , "Lifestyle"
  ];

  @override
  initState() {
    super.initState();
    _controller =
    AnimationController(duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _rotationTween = Tween<double>(
      begin: 0.0,
      end: widget.index.toDouble(),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(PageSelector oldWidget) {
    if (widget.index != oldWidget.index) {
      _rotationTween = Tween<double>(
        begin: _rotationTween.evaluate(_controller),
        end: widget.index.toDouble(),
      );

      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    super.dispose();
  }

  //
  Widget _selectorRing() {
    return Container(
      width: _widgetHeight,
      height: _widgetHeight,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.fromRGBO(79, 79, 79, 1.0),
          width: 1.5,
        ),
      ),
      child:/* FadeTransition(
        opacity: _controller,
          child: */Container(
            padding: const EdgeInsets.only(top: 40.0),
            child: GestureDetector(
    child:Row(
                children:[
                  Text(
                    'Donate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   Icon(Icons.keyboard_arrow_down,color: Colors.white)
                ],mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center),onTap: ()=>widget.lastScreen()),
          ),
    );
  }

  Widget _title(int index){
   return Align(
       alignment: Alignment.topCenter,
       child: FractionalTranslation(
       translation: Offset(0.0, -2.0),
    child:
     Text(categories[index-2],style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center)));
  }




  double get _widgetHeight => widget.screenSize.height * 0.4;

  @override
  Widget build(BuildContext context) {
    final List<Widget> stackChildren = [
      _selectorRing(),
      _title(widget.index),
    ];
    for (int i = 0; i < widget.pages.length; i++) {
      final double radialOffset = _widgetHeight / 2;
      final double radianDiff = (2 * pi) / widget.pages.length;
      final double rotationFactor = _rotationTween.animate(_controller).value;
      final double startRadian = -pi / 2 + -rotationFactor * radianDiff;
      final double radians = startRadian + i * radianDiff;
      final double dx = radialOffset * cos(radians);
      final double dy = radialOffset * sin(radians);

      stackChildren.add(
        Transform.translate(
          offset: Offset(dx, dy),
          child: SphereWidget(
            page: widget.pages[i],
            currentlyInMainPos: i == widget.index,
            index: widget.index,
            color:widget.color,
          ),
        ),
      );
    }

    return Container(
      height: _widgetHeight,
      child: Stack(
        alignment: Alignment.center,
        children: stackChildren,
      ),
    );
  }
}

enum ClickDirection { Left, Right }