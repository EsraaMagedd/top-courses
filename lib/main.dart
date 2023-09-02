import 'package:flutter/material.dart';
import 'package:top_courses/screens/splash.dart';
import 'package:top_courses/screens/home.dart';

Future main() async {
  runApp(const MyApp());
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