import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'CategoryCourses.dart';
import 'science_courses.dart';


class Category extends StatefulWidget {
  @override
  _Category createState() => _Category();
}
class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.blue.shade900,
          leading:BackButton(
          color: Colors.white,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Design',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.more_vert),
                SizedBox(width: 10,),
              ],
            ),

          ],
        ),
        body:Column(
          children: [
            CategoryCourses(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline_outlined),
              label: 'Saved Courses',
            ),
          ],
          currentIndex: 0,
          onTap: (int index) {
            // Do something when a tab is tapped.
          },
        ),
      ),
    );
  }
}


