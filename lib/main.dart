import 'package:flutter/material.dart';
import 'package:top_courses/screens/Category.dart';
import 'package:top_courses/screens/splash.dart';
import 'package:top_courses/screens/home.dart';

void main()  {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Courses',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}