import 'package:flutter/material.dart';
import 'package:top_courses/screens/all_category_screen.dart';
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