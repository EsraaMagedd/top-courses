import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_courses/screens/popular_recommended.dart';
import 'all_category_courses.dart';
import 'category_courses.dart';


class AllCategory extends StatelessWidget {
  int selected_index=0;
  AllCategory(selected_index){
    this.selected_index=selected_index;
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
          leading:BackButton(
          color: Colors.white,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '${AllCourses[selected_index][0].Category} Courses',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.more_vert),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
        body:Column(
          children: [
            SizedBox(height: 10,),
            // Popular Courses
            ListTile(
              leading: Text('All ${AllCourses[selected_index][0].Category} Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  // Do something when the button is pressed.
                },
                child: Text('Filter',style: TextStyle(color: Colors.blue.shade900),),
                // Row(
                //   children: [
                //     Icon(Icons.filter_list,color: Colors.blue.shade900,),
                //     Text('Filter',style: TextStyle(color: Colors.blue.shade900),),
                //
                //   ],
                // ),
              ),
            ),
            AllCategoryCourses(selected_index),
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

