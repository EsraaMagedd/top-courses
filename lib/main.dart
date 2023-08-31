import 'package:flutter/material.dart';
import 'package:top_courses/screens/splash.dart';
Future main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Courses',
      home: Splash(),
    );
  }
}