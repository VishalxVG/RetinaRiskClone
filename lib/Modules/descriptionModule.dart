import 'package:flutter/material.dart';

class DescriptionModule {
  String type1;
  String type2;
  String iconpath;
  Color boxcolor;

  DescriptionModule({
    required this.type1,
    required this.type2,
    required this.iconpath,
    required this.boxcolor,
  });
  static List<DescriptionModule> getDescription() {
    List<DescriptionModule> descriptions = [];

    descriptions.add(
      DescriptionModule(
          type1: "GENDER",
          type2: "Male",
          iconpath: "assets/images/gender.svg",
          boxcolor: Colors.grey),
    );
    descriptions.add(
      DescriptionModule(
          type1: "TYPE",
          type2: "Type 1",
          iconpath: "assets/images/roman1.svg",
          boxcolor: Colors.grey),
    );
    descriptions.add(
      DescriptionModule(
          type1: "Duration",
          type2: "0 Years",
          iconpath: "assets/images/calender.svg",
          boxcolor: Colors.grey),
    );
    descriptions.add(
      DescriptionModule(
          type1: "Diagnosis",
          type2: "Yes",
          iconpath: "assets/images/exam.svg",
          boxcolor: Colors.grey),
    );
    return descriptions;
  }
}
