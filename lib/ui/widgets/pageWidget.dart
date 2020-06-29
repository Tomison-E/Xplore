import 'dart:math';

import 'package:flutter/material.dart';


class SphereWidget extends StatefulWidget {
  final int page;
  final int index;
  final bool currentlyInMainPos;
  final Color color;

  const SphereWidget({Key key, this.page, this.currentlyInMainPos = false,this.index=2,this.color})
      : super(key: key);
  @override
  _SphereWidgetState createState() => _SphereWidgetState();
}

class _SphereWidgetState extends State<SphereWidget>
    with TickerProviderStateMixin {
  final double constDiameter = 25.0;
  final double diameter =0.5;
  final Color color = Color.fromRGBO(128, 127, 131, 1.0);
  final double moonOrbitRadius = 20.0;
  AnimationController _rotationController;
  AnimationController _moonOrbitLengthController;
  Animation<double> _moonOrbitLength;

  @override
  void initState() {
    super.initState();
    _rotationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    if (widget.currentlyInMainPos) {
      _rotationController.repeat();
    }

    _moonOrbitLengthController =
    AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _moonOrbitLength = Tween<double>(begin: 0.0, end: moonOrbitRadius)
        .animate(_moonOrbitLengthController);
    _moonOrbitLengthController.forward();
  }

  @override
  void didUpdateWidget(SphereWidget oldWidget) {
    if (widget.currentlyInMainPos != oldWidget.currentlyInMainPos) {
      _moonOrbitLengthController.forward(from:0.0);
      _rotationController.forward(from:0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _rotationController.dispose();
    super.dispose();
  }


  Widget _buildCelestialBody({bool orbit,bool empty=false}) {
    return Center(
      child: Container(
        width: empty?0.1:orbit?0.2* constDiameter:diameter * constDiameter,
        height:  empty?0.1:orbit?0.2* constDiameter:diameter * constDiameter,
        decoration: BoxDecoration(
          color:  empty?Colors.transparent:orbit?color:widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   // final int page = widget.page;
    int spheres = widget.currentlyInMainPos?2:0;

    final List<Widget> bodies = [_buildCelestialBody(orbit: false)];

    if (spheres > 0 && widget.currentlyInMainPos) {
      for (int i = 0; i < spheres; i++) {
        final double radians = (2 * pi / spheres) * i;
        final double dx = _moonOrbitLength.value * cos(radians);
        final double dy = _moonOrbitLength.value * sin(radians);

        bodies.add(
          Transform.translate(
            offset: Offset(dx, dy),
            child: _buildCelestialBody(orbit: true),
          ),
        );
      }
    }

    return RotationTransition(
      turns: _rotationController,
      child: Container(
        width: 100.0,
        height: 100.0,
        child: Stack(
          overflow: Overflow.visible,
          children: bodies,
        ),
      ),
    );
  }
}