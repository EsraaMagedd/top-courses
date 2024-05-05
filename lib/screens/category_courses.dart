import 'package:flutter/material.dart';
import 'all_category_courses.dart';
import 'all_category_screen.dart';
import 'home.dart';

// Assuming AllCourses is defined somewhere

class CategoryCourses extends StatelessWidget {
  final int selected_index;

  CategoryCourses(this.selected_index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: Text(
              '${AllCourses[selected_index][0].Category} Courses',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCategory(selected_index),
                  ),
                );
              },
              child: Text('View All', style: TextStyle(color: Color(0xff046edb))),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          ),
          // Popular Courses
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: AllCourses[selected_index].length,
              itemBuilder: (context, index) {
                return Courses(
                  index: index,
                  selected_index: selected_index,
                  Category: AllCourses[selected_index][index].Category,
                  photo: AllCourses[selected_index][index].photo,
                  title: AllCourses[selected_index][index].title,
                  views: AllCourses[selected_index][index].views,
                  hours: AllCourses[selected_index][index].hours,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
