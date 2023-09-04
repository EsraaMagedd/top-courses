import 'package:flutter/material.dart';
import 'all_category_courses.dart';
import 'all_category_screen.dart';
import 'home.dart';


class CategoryCourses extends StatelessWidget {
  @override

  int selected_index=0;
  CategoryCourses(selected_index){
    this.selected_index=selected_index;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          ListTile(
            leading: Text('${AllCourses[selected_index][0].Category} Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                // Do something when the button is pressed.
              },

              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => AllCategory(selected_index)),);
                },
                child: Text('View All',style: TextStyle(color: Colors.blue.shade900),),
              ),

            ),
          ),
          // Popular Courses
          Expanded(child:
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: AllCourses.length,
            itemBuilder: (context, index) {
              return Courses(
                Category: AllCourses[1][index].Category,
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
// class ScienceCard extends StatelessWidget {
//   final String photo;
//   final String title;
//   final String views;
//   final int hours;
//
//   const ScienceCard({
//     required this.photo,
//     required this.title,
//     required this.views,
//     required this.hours,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 150, // Adjust the width to your preference
//             height: 100, // Adjust the height to your preference
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 photo, // Replace with your image URL
//               ),
//             ),
//           ),
//
//           SizedBox(width: 80,),
//           Padding(
//             padding: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(width: 20,),
//                 Text(title),
//                 SizedBox(height: 15,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.remove_red_eye,
//                       size: 12,
//                       color: Colors.blue,
//                     ),
//
//                     Text(
//                       views,
//                       style: TextStyle(fontSize: 12),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Icon(
//                       Icons.watch_later,
//                       size: 15,
//                     ),
//                     Text(
//                       '${hours} h',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

