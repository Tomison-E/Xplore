import 'package:explore/core/models/animal.dart';
import 'package:explore/core/models/donate.dart';
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
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.rain_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, Lagos"
        ),
        Scene(
            action: "Record",year: "2020",month: "03/03",period: CustomIcons.moon,videoUrl: "assets/views/view.gif",location: "Lakipa County, ogba"
        )
      ],
   donate:Donate(
   organization: "NIGERIA NATURE PARK",headline: "Save spetacular animals on this planet and protect the forest",count: 300,received: "2,5m",target: "9,5m",percentage: 26.3
   ,logo: "assets/icons/hamb-menu.png",images: [
   "assets/donate/animal-10.jpeg", "assets/donate/animal-11.jpg","assets/donate/animal-12.jpeg"
   ]
   ),
      primaryColor: Color.fromRGBO(240, 201, 14, 1.0),
      secondaryColor: Color.fromRGBO(209, 174, 8, 1.0),
      tertiaryColor: Color.fromRGBO(171, 147, 36, 1.0),
    ),
    Animal(
      image: "assets/animals/animal-7.png",
      name: "RHINOS",
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
        "19,000","13,000","221,000","654,234","5,500",
      ],
      scenes: <Scene>[
        Scene(
            action: "Record",year: "2020",month: "23/06",period: CustomIcons.sun_inv,videoUrl: "assets/views/view4.gif",location: "Lagos City, Oakshore"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.rain_inv,videoUrl: "assets/views/view4.gif",location: "Offshore County, Texas"
        ),
        Scene(
            action: "Record",year: "2020",month: "03/03",period: CustomIcons.moon,videoUrl: "assets/views/view4.gif",location: "City Park, Ghana"
        )
      ],
      donate:Donate(
          organization: "NIGERIA NATURE PARK",headline: "Save spetacular animals on this planet and protect the forest",count: 282,received: "5m",target: "10m",percentage: 50.0
          ,logo: "assets/icons/hamb-menu.png",images: [
        "assets/donate/animal-4.jpg","assets/donate/animal-5.jpeg","assets/donate/animal-6.jpeg"
      ]
      ),
      primaryColor: Color.fromRGBO(121,212,170, 1.0),
      secondaryColor: Color.fromRGBO(102, 176, 142, 1.0),
      tertiaryColor: Color.fromRGBO(101, 156, 131, 1.0),
    ),
    Animal(
      image: "assets/animals/animal-9.png",
      name: "LEOPARD",
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
        "19,000","13,000","221,000","654,234","84",
      ],
      scenes: <Scene>[
        Scene(
            action: "Record",year: "2020",month: "23/06",period: CustomIcons.sun_inv,videoUrl: "assets/views/view3.gif",location: "Lagos City, Oakshore"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.rain_inv,videoUrl: "assets/views/view3.gif",location: "Offshore County, Texas"
        ),
        Scene(
            action: "Record",year: "2020",month: "03/03",period: CustomIcons.moon,videoUrl: "assets/views/view3.gif",location: "City Park, Ghana"
        )
      ],
      donate:Donate(
          organization: "NIGERIA NATURE PARK",headline: "Save spetacular animals on this planet and protect the forest",count: 282,received: "2,5m",target: "10m",percentage: 25.0
          ,logo: "assets/icons/hamb-menu.png",images: [
        "assets/donate/animal-7.jpeg","assets/donate/animal-8.jpeg","assets/donate/animal-9.jpeg"
      ]
      ),
      primaryColor: Color.fromRGBO(106,72,129, 1.0),
      secondaryColor: Color.fromRGBO(80, 54, 97, 1.0),
      tertiaryColor: Color.fromRGBO(75, 54, 89, 1.0),
    ),
    Animal(
      image: "assets/animals/animal-8.png",
      name: "ORANGUTAN",
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
        "19,000","13,000","221,000","654,234","104,700",
      ],
      scenes: <Scene>[
        Scene(
            action: "Record",year: "2020",month: "23/06",period: CustomIcons.sun_inv,videoUrl: "assets/views/view2.gif",location: "Lagos City, Oakshore"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.rain_inv,videoUrl: "assets/views/view2.gif",location: "Offshore County, Texas"
        ),
        Scene(
            action: "Record",year: "2020",month: "03/03",period: CustomIcons.moon,videoUrl: "assets/views/view2.gif",location: "City Park, Ghana"
        )
      ],
      donate:Donate(
          organization: "NIGERIA NATURE PARK",headline: "Save spetacular animals on this planet and protect the forest",count: 282,received: "2,5m",target: "10m",percentage: 25.0
          ,logo: "assets/icons/hamb-menu.png",images: [
        "assets/donate/animal-1.jpeg", "assets/donate/animal-2.jpeg", "assets/donate/animal-3.jpeg"
      ]
      ),
      primaryColor: Color.fromRGBO(17, 245, 180, 1.0),
      secondaryColor: Color.fromRGBO(8, 209, 152, 1.0),
      tertiaryColor: Color.fromRGBO(34, 163, 127, 1.0),
    ),
    /*Animal(
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
            action: "Live",year: "2020",month: "23/06",period: CustomIcons.rain_inv,videoUrl: "assets/views/view.gif",location: "Lakipa County, Kenya"
        ),
        Scene(
            action: "Live",year: "2019",month: "23/02",period: CustomIcons.moon,videoUrl: "assets/views/view.gif",location: "Lakipa County, lekki"
        ),
        Scene(
            action: "Live",year: "2020",month: "03/03",period: CustomIcons.moon,videoUrl: "assets/views/view.gif",location: "Lakipa County, congo"
        )
      ],
      donate: Donate(
        organization: "LAGOS STATE CONSERVATION CENTER",headline: "Save spetacular animals on this planet and protect the forest",count: 300,received: "2,5m",target: "9,5m",percentage: 26.3
          ,logo: "assets/icons/hamb-menu.png",images: [
        "assets/animals/animal-6.png","assets/animals/animal-5.png"
      ]
      ),
      primaryColor: Color.fromRGBO(210, 201, 118, 1.0),
      secondaryColor: Color.fromRGBO(29, 171, 109, 1.0),
      tertiaryColor: Color.fromRGBO(22, 156, 104, 1.0),
    )*/
  ];


}