import 'package:flutter/material.dart';
import 'package:top_courses/screens/LogIn.dart';
import 'package:top_courses/screens/SignUp.dart';
import 'package:top_courses/screens/Start.dart';
import 'package:top_courses/screens/category_screen.dart';
import 'package:top_courses/screens/single_course.dart';
import 'package:top_courses/screens/splash.dart';
import 'package:top_courses/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Courses',
      theme: ThemeData(fontFamily: 'Mukta'),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
