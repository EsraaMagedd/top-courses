import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/cubit/home_cubit.dart';
import 'package:top_courses/cubit/home_cubit.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'package:top_courses/screens/profile_page.dart';
import 'package:top_courses/screens/saved.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_cubit.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff046edb),
        title: Text('Hi, Learner'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Saved()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person_sharp),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, int>(
        builder: (context, selectedIndex) {
          return Column(
            children: [
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Color(0xff046edb),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find a course you \n"
                                "want to learn",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //HorizontalTabs(),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _tabs.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                cubit.updateSelectedIndex(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 6),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color: selectedIndex == index
                                        ? Color(0xff046edb)
                                        : Colors.transparent,
                                  ),
                                  child: Text(
                                    _tabs[index],
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Color(0xff046edb),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              displaySelectedWidget(selectedIndex),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

Widget displaySelectedWidget(int index) {
  switch (index) {
    case 0:
      return PopularRecommended();
    case 1:
      return CategoryCourses(0);
    case 2:
      return CategoryCourses(1);
    case 3:
      return CategoryCourses(2);
    case 4:
      return CategoryCourses(3);
    default:
      return CategoryCourses(
          0); // Alternatively, return a default widget if index is out of range.
  }
}

class Popular extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const Popular({
    required this.photo,
    required this.title,
    required this.views,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            width: 150, // Adjust the width to your preference
            height: 100, // Adjust the height to your preference
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                photo, // Replace with your image URL
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 12,
                      color: Colors.blue,
                    ),
                    Text(
                      views,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.watch_later,
                      size: 15,
                    ),
                    Text(
                      '${hours} h',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const Recommended({
    required this.photo,
    required this.title,
    required this.views,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            width: 150, // Adjust the width to your preference
            height: 100, // Adjust the height to your preference
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                photo, // Replace with your image URL
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 12,
                        color: Colors.blue,
                      ),
                      Text(
                        views,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                      Text(
                        '${hours} h',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _tabs = [
  ' All ',
  ' Technologies ',
  ' Science ',
  ' Languages ',
  ' Marketing ',
];

List<Popular> popularCourses = [
  const Popular(
    photo: 'assets/tech/cs50.jpg',
    title: 'CS50',
    views: '100k',
    hours: 40,
  ),
  const Popular(
    photo: 'assets/marketing/marketing.png',
    title: 'Marketing',
    views: '50k',
    hours: 30,
  ),
  const Popular(
    photo: 'assets/tech/flutter.webp',
    title: 'Flutter',
    views: '20k',
    hours: 20,
  ),
  const Popular(
    photo: 'assets/tech/ccna.png',
    title: 'CCNA',
    views: '20k',
    hours: 20,
  ),
];
List<Recommended> RecommendedCourses = [
  const Recommended(
    photo: 'assets/language/english.jpg',
    title: 'English',
    views: '100k',
    hours: 40,
  ),
  const Recommended(
    photo: 'assets/science/physics.jpg',
    title: 'Physics',
    views: '50k',
    hours: 30,
  ),
  const Recommended(
    photo: 'assets/marketing/social.jpg',
    title: 'Social Media Marketing',
    views: '20k',
    hours: 20,
  ),
  const Recommended(
    photo: 'assets/language/german.jpg',
    title: 'German',
    views: '100k',
    hours: 40,
  ),
];
