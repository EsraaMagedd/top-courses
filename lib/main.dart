import 'package:flutter/material.dart';
import 'package:top_courses/screens/log_in.dart';
import 'package:top_courses/screens/profile_page.dart';
import 'package:top_courses/screens/sign_up.dart';
import 'package:top_courses/screens/Start.dart';
import 'package:top_courses/screens/all_category_screen.dart';
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
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
