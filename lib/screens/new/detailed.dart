
import 'package:flutter/material.dart';
import 'all.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleCourse extends StatelessWidget {
  final Course course;
  final String imageUrl;

  const SingleCourse({Key? key, required this.course, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.blue.shade50,

        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '${course.title} Course',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 10),
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
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Course Instructor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
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
                      backgroundImage: AssetImage('assets/instructor.png'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Text(
                    '  Eng. Ahmed Allam',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Course Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' This course offers a structured approach to understanding key'
                      ' concepts and mastering essential skills. Through engaging '
                      'lectures, hands-on exercises, and real-world examples, '
                      'you\'ll gain a solid understanding. Unlock your potential.',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.grey.shade50,
        backgroundColor: const Color(0xff046edb).withOpacity(.2),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xff0497f5),
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Color(0xff0497f5),
          ),
          Icon(
            Icons.bookmark_outline_outlined,
            size: 30,
            color: Color(0xff0497f5),
          ),
        ],
      ),
    );
  }
}
