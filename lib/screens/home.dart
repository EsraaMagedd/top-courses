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
List<String> _tabs = [
  ' All ',
  ' Technologies ',
  ' Science ',
  ' Languages ',
  ' Marketing ',
];