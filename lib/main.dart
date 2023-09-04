import 'package:flutter/material.dart';
import 'package:top_courses/screens/category_screen.dart';
import 'package:top_courses/screens/single_course.dart';
import 'package:top_courses/screens/splash.dart';
import 'package:top_courses/screens/home.dart';
import 'package:top_courses/screens/splash_screen.dart';

void main()  {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Courses',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}