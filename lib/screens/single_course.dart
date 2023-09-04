import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'category_courses.dart';
import 'home.dart';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';

class SingleCourse extends StatelessWidget {
  int selected_index = 0;
  int index = 0;
  SingleCourse(selected_index, index) {
    this.selected_index = selected_index;
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.blue.shade900,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            '${AllCourses[selected_index][index].title} Course',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AllCourses[selected_index][index].photo),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Spacer(),
                Icon(
                  Icons.bookmark_outline,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Course Instructor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/instructor.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Text('  Eng. Ahmed Allam',style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Course Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'This course will teach you the basics of Flutter, '
                        'a cross-platform mobile development framework created '
                        'by Google. You will learn how to create beautiful, '
                        'native-looking apps for Android and iOS using a single '
                        'codebase.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '       Enroll Now       ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
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
