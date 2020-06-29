/*
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore/ui/widgets/pageSelector.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<int> _pages = [0,1,2,3,4,5,6];
  int _currentPageIndex = 2;
  final StreamController _sc =
  StreamController.broadcast();

  dispose() {
    _sc.close();
    super.dispose();
  }

  _handleArrowClick(ClickDirection direction) {
    setState(() {
      switch (direction) {
        case ClickDirection.Left:
          _currentPageIndex--;
          break;
        case ClickDirection.Right:
          _currentPageIndex++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionalTranslation(
                  translation: Offset(0.0, 0.65),
                  child: PageSelector(
                    screenSize: screenSize,
                    pages: _pages,
                    index: _currentPageIndex,
                    onArrowClick: _handleArrowClick,
                    onPlanetClicked: () =>
                        _sc.sink.add(null),
                  ),
                ),
              ),
            ]
        )
    );
  }
}
*/
