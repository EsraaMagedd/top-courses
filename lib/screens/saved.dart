import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/cubit/home_cubit.dart';
import 'package:top_courses/cubit/home_cubit.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'package:top_courses/screens/profile_page.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_cubit.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';
import 'home.dart';


class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Courses'),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff046edb),
        elevation: 0,
      ),

      body: Column(
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.white,
        backgroundColor: Colors.blue.shade50.withOpacity(.2),
        items: const [
          Icon(
            Icons.home,
            size: 25,
            color: Color(0xff0497f5),
          ),
          Icon(
            Icons.person,
            size: 25,
            color: Color(0xff0497f5),
          ),
          Icon(
            Icons.bookmark_outline_outlined,
            size: 25,
            color: Color(0xff0497f5),
          ),
        ],
        onTap: (index) {
          if (index ==0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          else if (index == 1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
          else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Saved()),
            );
          }

        },
      ),

    );
  }
}

