import 'package:flutter/material.dart';

import 'home.dart';

class CategoryCourses extends StatefulWidget {

  @override
  _CategoryCourses createState() => _CategoryCourses();
}

class _CategoryCourses extends State<CategoryCourses> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10,),
          // Popular Courses
          ListTile(
            leading: Text('All '+AllCourses[1][0].title+' Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
          Expanded(child:
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: popularCourses.length,
            itemBuilder: (context, index) {
              return Courses(
                Category: AllCourses[1][index].Category,
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
class Courses extends StatelessWidget {
  final String Category;
  final String photo;
  final String title;
  final String views;
  final int hours;

  const Courses({
    required this.Category,
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
          SizedBox(width: 40,),
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
          SizedBox(width: 50,),
           Icon(Icons.bookmark_outline),


        ],
      ),
    );
  }
}

List<List<Courses>> AllCourses = [

  //tech
  [
    const Courses(
      Category: 'Technology',
      photo: 'assets/tech/DataScience.avif',
      title: 'Data Science',
      views: '80.5k',
      hours: 45,
    ),
    const Courses(
      Category: 'Technology',
      photo: 'assets/tech/cs50.jpg',
      title: 'CS50',
      views: '50k',
      hours: 30,
    ),
    const Courses(
      Category: 'Technology',
      photo: 'assets/tech/flutter.webp',
      title: 'Flutter',
      views: '20k',
      hours: 20,
    ),
    const Courses(
      Category: 'Technology',
      photo: 'assets/tech/web.avif',
      title: 'Web Design',
      views: '100k',
      hours: 25,
    ),
    const Courses(
      Category: 'Technology',
      photo: 'assets/tech/ccna.png',
      title: 'CCNA',
      views: '11.9k',
      hours: 15,
    ),
  ],
  //science
  [
    const Courses(
      Category: 'Science',
      photo: 'assets/science/biology.jpg',
      title: 'Biology',
      views: '56.2k',
      hours: 62,
    ),
    const Courses(
      Category: 'Science',
      photo: 'assets/science/chemistry.jpg',
      title: 'Chemistry',
      views: '50.5k',
      hours: 34,
    ),
    const Courses(
      Category: 'Science',
      photo: 'assets/science/geology.jpg',
      title: 'Geology',
      views: '20.9k',
      hours: 20,
    ),
    const Courses(
      Category: 'Science',
      photo: 'assets/science/physics.jpg',
      title: 'Physics',
      views: '70.5k',
      hours: 28,
    ),
    const Courses(
      Category: 'Science',
      photo: 'assets/science/math.jpg',
      title: 'Mathematics',
      views: '68k',
      hours: 36,
    ),
  ],
  //languages
  [
    const Courses(
      Category: 'Language',
      photo: 'assets/language/english.jpg',
      title: 'English',
      views: '150k',
      hours: 40,
    ),
    const Courses(
      Category: 'Languages',
      photo: 'assets/language/french.avif',
      title: 'French',
      views: '55.1k',
      hours: 30,
    ),
    const Courses(
      Category: 'Languages',
      photo: 'assets/language/german.jpg',
      title: 'German',
      views: '64k',
      hours: 20,
    ),
    const Courses(
      Category: 'Languages',
      photo: 'assets/language/italian.avif',
      title: 'Italian',
      views: '10k',
      hours: 40,
    ),
    const Courses(
      Category: 'Languages',
      photo: 'assets/language/spanish.jpg',
      title: 'Spanish',
      views: '10.7k',
      hours: 10,
    ),
  ],
  //marketing
  [
    const Courses(
      Category: 'Marketing',
      photo: 'assets/marketing/analytics.png',
      title: 'Marketing analytics',
      views: '18k',
      hours: 10,
    ),
    const Courses(
      Category: 'Marketing',
      photo: 'assets/marketing/automation.jpg',
      title: 'Marketing automation',
      views: '36k',
      hours: 10,
    ),
    const Courses(
      Category: 'Marketing',
      photo: 'assets/marketing/content.jpg',
      title: 'Content Strategy',
      views: '70k',
      hours: 10,
    ),
    const Courses(
      Category: 'Marketing',
      photo: 'assets/marketing/marketing.png',
      title: 'Digital Marketing',
      views: '80k',
      hours: 10,
    ),
    const Courses(
      Category: 'Marketing',
      photo: 'assets/marketing/social.jpg',
      title: 'Social Marketing',
      views: '59k',
      hours: 10,
    ),

  ],
];