import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'category_courses.dart';
import 'home.dart';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';

class SingleCourse extends StatefulWidget {
  @override
  _SingleCourse createState() => _SingleCourse();
}

class _SingleCourse extends State<SingleCourse> {
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
          title: const Text(
            'Marketing Automation Course',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/marketing/automation.jpg'),
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
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('15k Views'),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.access_time_filled_outlined,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('40h'),
              ],
            ),
            Text('Course Instructor'),
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                Text('Esraa Maged'),
              ],
            ),
            Text('Course Description'),
            Text('This course introduces the fundamental \n'
                'concepts and principles of marketing. Topics\n '
                'include the marketing mix, market segmentation,\n'
                ' customer behavior, branding, pricing, promotion, \n'
                'and distribution. Students will learn how to apply \n'
                'these concepts to develop and implement marketing \n'
                'strategies.'),
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
                      'Enroll Now',
                      style: TextStyle(fontSize: 30),
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
