import 'package:flutter/material.dart';
import 'package:top_courses/screens/Category.dart';

import 'home.dart';

class PopularRecommended extends StatefulWidget {
  @override
  _PopularRecommendedsState createState() => _PopularRecommendedsState();
}
int _selectedTabIndex = 0;
class _PopularRecommendedsState extends State<PopularRecommended> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          // Popular Courses
          ListTile(
            leading: Text('Popular Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                // Do something when the button is pressed.
              },
              child:
              TextButton(
                child: Text('View All',style: TextStyle(color: Colors.blue.shade900),),
                onPressed: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Category()),
                              );
                },
              ),




            ),
          ),
          Expanded(child:
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: popularCourses.length,
            itemBuilder: (context, index) {
              return Popular(
                photo: popularCourses[index].photo,
                title: popularCourses[index].title,
                views: popularCourses[index].views,
                hours: popularCourses[index].hours,
              );
            },
          ),
          ),

          // Recommended Courses
          ListTile(
            leading: Text('Recommended Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                // Do something when the button is pressed.
              },
              child: Text('View All',style: TextStyle(color: Colors.blue.shade900),),
            ),
          ),
          Expanded(child:
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: RecommendedCourses.length,
            itemBuilder: (context, index) {
              return Recommended(
                photo: RecommendedCourses[index].photo,
                title: RecommendedCourses[index].title,
                views: RecommendedCourses[index].views,
                hours: RecommendedCourses[index].hours,
              );
            },
          ),
          ),
        ],
      ),
    );

  }
}