import 'package:flutter/material.dart';

import 'package:retinarisk/Screens/(1)homeScreen.dart';
import 'package:retinarisk/common/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: barColor),
      ),
      title: 'RetinaRisk',
      home: const HomePage(
          selectedGender: "MALE",
          selectedType: "1",
          selectedDuration: "0",
          selectedChecked: true),
    );
  }
}
