// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zodiac_app/constants.dart';
import 'package:zodiac_app/screens/birth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: bgColor),
      debugShowCheckedModeBanner: false,
      home: BirthScreen(),
    );
  }
}
