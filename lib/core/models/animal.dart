import 'dart:ui';

import 'package:explore/core/models/donate.dart';
import 'package:explore/core/models/habitation.dart';
import 'package:explore/core/models/scene.dart';
class Animal{
  final String image;
  final String name;
  final List<String> population;
  final List<Environment> environment;
  final List<Scene> scenes;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Donate donate;


  Animal({this.image,this.name,this.environment,this.population,this.scenes,this.primaryColor,this.secondaryColor,this.tertiaryColor,this.donate});

}


class Environment{
  final Habitation habitation;
  final int percentage;

  Environment({this.habitation,this.percentage});
}