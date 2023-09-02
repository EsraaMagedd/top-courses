import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'DesignCourses.dart';
import 'ScienceCourses.dart';

int _selectedTabIndex = 0;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.blue.shade900,
          title: Text('Hi, Learner'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Do something
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Do something
              },
            ),
          ],
        ),
        body: Column(
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
                  color: Colors.blue.shade900,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Find a course you \n"
                          "    want to learn",
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
                        '   Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue.shade900),
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
                              setState(() {
                                _selectedTabIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 6),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue.shade900),
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedTabIndex == index
                                      ? Colors.blue.shade900
                                      : Colors.transparent,
                                ),
                                child: Text(
                                  _tabs[index],
                                  style: TextStyle(
                                    color: _selectedTabIndex == index
                                        ? Colors.white
                                        : Colors.blue.shade900,
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
            displaySelectedWidget(_selectedTabIndex),
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

Widget displaySelectedWidget(int index) {
  switch (index) {
    case 0:
      return PopularRecommended();
    case 1:
      return Science();
    case 2:
      return Design();
    default:
      return Design(); // Alternatively, return a default widget if index is out of range.
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

List<String> _tabs = [' All ', ' Science ', ' Design ', ' Marketing ', ' Languages ',' Technologies '];

List<Popular> popularCourses = [
  const Popular(
    photo: 'assets/machine.webp',
    title: 'Machine Learning',
    views: '100k',
    hours: 40,
  ),
  const Popular(
    photo: 'assets/marketing.png',
    title: 'Marketing',
    views: '50k',
    hours: 30,
  ),
  const Popular(
    photo: 'assets/math.jpg',
    title: 'Mathematics',
    views: '20k',
    hours: 20,
  ),
];
List<Recommended> RecommendedCourses = [
  const Recommended(
    photo: 'assets/math.jpg',
    title: 'Mathematics',
    views: '100k',
    hours: 40,
  ),
  const Recommended(
    photo: 'assets/machine.webp',
    title: 'Machine Learning',
    views: '50k',
    hours: 30,
  ),
  const Recommended(
    photo: 'assets/marketing.png',
    title: 'Marketing',
    views: '20k',
    hours: 20,
  ),
];