import 'package:al_app_api/Subject/streamSub/biology.dart';
import 'package:al_app_api/Subject/streamSub/maths.dart';
import 'package:al_app_api/Subject/streamSub/tech.dart';
import 'package:flutter/material.dart';

import '../../Subject/bio/agry.dart';
import '../../Subject/bio/bio.dart';
import '../../Subject/commers/accounting.dart';
import '../../Subject/commers/businessStudies.dart';
import '../../Subject/commers/economics.dart';
import '../../Subject/maths/chem.dart';
import '../../Subject/maths/cmathsjson.dart';

import '../../Subject/maths/it.dart';
import '../../Subject/maths/phy.dart';

import '../../Subject/streamSub/cormmes.dart';
import '../../Subject/tech/bst.dart';
import '../../Subject/tech/civic.dart';
import '../../Subject/tech/electronic.dart';
import '../../Subject/tech/engineering.dart';
import '../../Subject/tech/mechanical.dart';
import '../../Subject/tech/sft.dart';
import 'homeModel.dart';

class AbImage1 {
  static const String home = "assets/image/b2.jpg";
  static const String subject = "assets/image/b3.png";
  static const String year = "assets/image/b4.jpg";
  // static const String card = "assets/image/w3.jpg";
  // static const String yearcard = "assets/image/w3.jpg";
  // static const String yearmarkig = "assets/image/w3.jpg";
}

class Colorlab {
  // static const Color deepPurple = Colors.deepPurple;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color darkBlue = Color.fromARGB(255, 0, 1, 29);
}

class SubjectList {
  // static Widget sub = HomeModel("Bio", Bio());
  static final List<HomeModel111> streamsub = [
    const HomeModel111(
      "Maths",
      Maths(),
      "assets/new/5.jpg",
    ),
    const HomeModel111(
      "Bio",
      Biology(),
      "assets/new/1.jpg",
    ),
    const HomeModel111(
      "Commerce",
      Commerce(),
      "assets/new/2.jpg",
    ),
    const HomeModel111(
      "Tech",
      Tech(),
      "assets/new/3.jpg",
    ),
  ];

  static final List<HomeModel111> biology = [
    HomeModel111(
      "Bio",
      Bio(),
      "assets/new/1.jpg",
    ),
    HomeModel111(
      "Physics",
      Phy(),
      "assets/new/6.jpg",
    ),
    HomeModel111(
      "Chemistry",
      Chem(),
      "assets/new/7.jpg",
    ),
    HomeModel111(
      "Agri",
      Agry(),
      "assets/new/9.jpg",
    ),
  ];
  static final List<HomeModel111> maths = [
    HomeModel111(
      "C Maths",
      Cmaths(),
      "assets/new/5.jpg",
    ),
    HomeModel111(
      "Physics",
      Phy(),
      "assets/new/6.jpg",
    ),
    HomeModel111(
      "Chemistry",
      Chem(),
      "assets/new/7.jpg",
    ),
    HomeModel111(
      "ICT",
      Ict(),
      "assets/new/8.jpg",
    ),
  ];
  static final List<HomeModel111> commerce = [
    HomeModel111(
      "Economics",
      Economics(),
      "assets/new/10.jpg",
    ),
    HomeModel111(
      "Accounting",
      Accounting(),
      "assets/new/6.jpg",
    ),
    HomeModel111(
      "Busi.Studies",
      BusinessStudies(),
      "assets/new/12.jpg",
    ),
    HomeModel111(
      "ICT",
      Ict(),
      "assets/new/8.jpg",
    ),
  ];
  static final List<HomeModel111> tech = [
    HomeModel111(
      "SFT",
      SFT(),
      "assets/new/13.jpg",
    ),
    HomeModel111(
      "BST",
      BST(),
      "assets/new/14.jpg",
    ),
    HomeModel111(
      "ICT",
      Ict(),
      "assets/new/8.jpg",
    ),
    HomeModel111(
      "Engine T",
      Engineering(),
      "assets/new/15.jpg",
    ),
    HomeModel111(
      "Civic",
      Civic(),
      "assets/new/16.jpg",
    ),
    HomeModel111(
      "Electronic T",
      Electronic(),
      "assets/new/17.jpg",
    ),
    HomeModel111(
      "Mechanical T",
      Mechanical(),
      "assets/new/18.jpg",
    ),
    HomeModel111(
      "Agri",
      Agry(),
      "assets/new/9.jpg",
    ),
    HomeModel111(
      "Economics",
      Economics(),
      "assets/new/10.jpg",
    ),
  ];
}

class AppColor {
  static const bool steambool = true;
  static const bool subbool = true;
  static const bool yearbool = true;
}

// class SubColor {
//   static const List<Color> maths = [
//     Color.fromARGB(255, 10, 121, 239),
//     Color.fromARGB(255, 99, 244, 254),
//   ];
//   static const List<Color> biology = [
//     Color.fromARGB(255, 35, 233, 127),
//     Color.fromARGB(255, 85, 238, 220),
//   ];
//   static const List<Color> cmaths = [
//     Color.fromARGB(255, 10, 121, 239),
//     Color.fromARGB(255, 99, 244, 254),
//   ];
//   static const List<Color> phy = [
//     Color.fromARGB(255, 233, 217, 35),
//     Color.fromARGB(255, 233, 60, 129),
//   ];
//   static const List<Color> chem = [
//     Color.fromARGB(255, 61, 35, 233),
//     Color.fromARGB(255, 54, 146, 245),
//   ];
//   static const List<Color> bio = [
//     Color.fromARGB(255, 35, 233, 127),
//     Color.fromARGB(255, 85, 238, 220),
//   ];
// }
