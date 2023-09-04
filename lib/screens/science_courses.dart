import 'package:flutter/material.dart';

import 'CategoryCourses.dart';
import 'home.dart';

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState();
}
int _selectedTabIndex = 1;
class _ScienceState extends State<Science> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          // Popular Courses
          ListTile(
            leading: Text('Science Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
            scrollDirection: Axis.vertical,
            itemCount: AllCourses[1].length,
            itemBuilder: (context, index) {
              return ScienceCard(
                photo: AllCourses[1][index].photo,
                title: AllCourses[1][index].title,
                views: AllCourses[1][index].views,
                hours: AllCourses[1][index].hours,
              );
            },
          ),
          ),


        ],
      ),
    );

  }
}
class ScienceCard extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const ScienceCard({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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

          SizedBox(width: 80,),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Text(title),
                SizedBox(height: 15,),
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
