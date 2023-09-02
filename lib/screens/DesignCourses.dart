import 'package:flutter/material.dart';

import 'home.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}
int _selectedTabIndex = 2;
class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          // Popular Courses
          ListTile(
            leading: Text('Design Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
            itemCount: popularCourses.length,
            itemBuilder: (context, index) {
              return DesignCard(
                photo: popularCourses[index].photo,
                title: popularCourses[index].title,
                views: popularCourses[index].views,
                hours: popularCourses[index].hours,
              );
            },
          ),
          ),


        ],
      ),
    );

  }
}
class DesignCard extends StatelessWidget {
  final String photo;
  final String title;
  final String views;
  final int hours;

  const DesignCard({
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
          SizedBox(width: 50,),
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