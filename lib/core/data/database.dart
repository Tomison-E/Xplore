import 'package:explore/core/models/animal.dart';
import 'package:explore/core/models/habitation.dart';
import 'package:explore/core/models/scene.dart';
import 'package:explore/ui/icons/icons.dart';
import 'package:flutter/material.dart';

class Database{

   static List<Habitation> habitation = [
    Habitation(
      name: "SAVANNA",
      firstImage: "assets/habitat/habitat-1.png",
      secondImage: "assets/habitat/habitat-2.png",
    ),
    Habitation(
      name: "FOREST",
      firstImage: "assets/habitat/habitat-3.png",
      secondImage: "assets/habitat/habitat-4.png",
    ),
    Habitation(
      name: "GrASSLAND",
      firstImage: "assets/habitat/habitat-1.png",
      secondImage: "assets/habitat/habitat-6.png",
    )
  ];

  static List<Animal> animalData= [
    Animal(
      image: "assets/animals/animal-5.png",
      name: "ELEPHANT",
      environment: <Environment>[
        Environment(
          habitation: habitation[0],
          percentage: 55
        ),
        Environment(
            habitation: habitation[1],
            percentage: 25
        )
      ],
      population:  [
        "134,000","223,000","122,000","654,000","765,221",
        "19,000","13,000","221,000","654,234","123,000",
        "134,000","223,000","122,000","654,000","765,221",
        "19,000","13,000","221,000","654,234","123,000",
        ],
      scenes: <Scene>[
        Scene(
          action: "Record",year: "2020",month: "23/06",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, Kenya"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, Lagos"
        ),
        Scene(
            action: "Record",year: "2020",month: "03/03",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, ogba"
        )
      ],
      primaryColor: Color.fromRGBO(245, 204, 17, 1.0),
      secondaryColor: Color.fromRGBO(222, 184, 13, 1.0),
      tertiaryColor: Color.fromRGBO(171, 145, 27, 1.0),
    ),
    Animal(
      image: "assets/animals/animal-6.png",
      name: "PANDA",
      environment: <Environment>[
        Environment(
            habitation: habitation[1],
            percentage: 75
        ),
        Environment(
            habitation: habitation[2],
            percentage: 45
        )
      ],
      population:  [
        "134,000","223,000","122,000","654,000","765,221",
        "19,000","13,000","221,000","654,234","123,000",
        "134,000","223,000","122,000","654,000","765,221",
        "19,000","13,000","221,000","654,234","123,000",
      ],
      scenes: <Scene>[
        Scene(
            action: "Live",year: "2020",month: "23/06",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, Kenya"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, lekki"
        ),
        Scene(
            action: "Live",year: "2020",month: "03/03",period: CustomIcons.sun_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, congo"
        )
      ],
      primaryColor: Color.fromRGBO(210, 201, 118, 1.0),
      secondaryColor: Color.fromRGBO(29, 171, 109, 1.0),
      tertiaryColor: Color.fromRGBO(22, 156, 104, 1.0),
    )
  ];


}