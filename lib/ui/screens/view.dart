import 'package:explore/core/data/database.dart';
import 'package:explore/core/models/animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class View extends StatefulWidget {
  final int currentAnimalIndex;

  View({@required this.currentAnimalIndex})
      : assert(currentAnimalIndex != null);
  @override
  State<StatefulWidget> createState() {
    return _View();
  }
}

class _View extends State<View> {
  double index = 0.0;
  Animal _animal;

  @override
  void initState() {
    _animal = Database.animalData[widget.currentAnimalIndex];
    super.initState();
  }

  @override
  void didUpdateWidget(View oldWidget) {
    if (widget.currentAnimalIndex != oldWidget.currentAnimalIndex) {
      _animal = Database.animalData[widget.currentAnimalIndex];
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 35),
                    Icon(
                      _animal.scenes[index.toInt()].period,
                      color: _animal.primaryColor,
                      size: 50,
                    ),
                    SizedBox(width: 25),
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Text(_animal.scenes[index.toInt()].year,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 50),
                        Text(_animal.scenes[index.toInt()].month,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ))
                  ],
                ),
                Text(
                  "                ${_animal.scenes[index.toInt()].location}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: EdgeInsets.all(15),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Colors.red, radius: 5),
                    SizedBox(width: 10),
                    Text(_animal.scenes[index.toInt()].action,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(height: 10),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(51, 51, 51, 1.0),
                            offset: Offset(0.0, 1.5)),
                        BoxShadow(
                            color: Color.fromRGBO(59, 59, 59, 1.0),
                            offset: Offset(0.0, 1.8)),
                      ]),
                  child: Padding(
                    child: PageView(
                      children: _animal.scenes
                          .map((scene) => Material(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                        image: AssetImage(scene.videoUrl),
                                        fit: BoxFit.cover),
                                    color: Colors.transparent),
                              ),
                              elevation: 30,
                              color: Colors.transparent,
                              shadowColor: Color.fromRGBO(51, 51, 51, 1.0)))
                          .toList(),
                      onPageChanged: (view) {
                        index = view + 0.0;
                        setState(() {});
                      },
                    ),
                    padding: EdgeInsets.only(left: 10, right: 10),
                  ),
                  padding: EdgeInsets.only(bottom: 15),
                )),
                SizedBox(height: 15),
                DotsIndicator(
                  position: index,
                  dotsCount: _animal.scenes.length,
                  decorator: DotsDecorator(
                    color: Color.fromRGBO(134, 134, 134, 1.0),
                    activeColor: _animal.primaryColor,
                  ),
                ),
                SizedBox(height: 30),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }
}
