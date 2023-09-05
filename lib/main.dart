import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:top_courses/cubit/login_cubit.dart';
import 'package:top_courses/screens/log_in.dart';
import 'package:top_courses/screens/profile_page.dart';
import 'package:top_courses/screens/saved.dart';
import 'package:top_courses/screens/sign_up.dart';
import 'package:top_courses/screens/Start.dart';
import 'package:top_courses/screens/all_category_screen.dart';
import 'package:top_courses/screens/single_course.dart';
import 'package:top_courses/screens/splash.dart';
import 'package:top_courses/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';

void main() {
  runApp(MyApp());
}

int _index = 0;

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(

        title: 'Top Courses',
        debugShowCheckedModeBanner: false,
        home: Login(),

      ),
    );
  }
}

List _screens = [
  Home(),
  ProfilePage(),
  Saved(),
];
