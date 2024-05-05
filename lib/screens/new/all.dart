import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'detailed.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // This line removes the back button
          title: Center(child: Text('Find a course you wanted to learn',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          backgroundColor: Color(0xffdde2f6),
          bottom: TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Technologies'),
              Tab(text: 'Languages'),
              Tab(text: 'Marketing'),
              Tab(text: 'Science'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllCourses(uri: 'http://192.168.56.1:3000/api/courses', asset: 'assets/course.webp'),
            CategoryCourses(uri: 'http://192.168.56.1:3000/api/technologies', asset:  'assets/tech/cs50.jpg'),
            CategoryCourses(uri: 'http://192.168.56.1:3000/api/languages', asset: 'assets/language/chinese.jpg'),
            CategoryCourses(uri: 'http://192.168.56.1:3000/api/marketings', asset: 'assets/marketing/content.jpg'),
            CategoryCourses(uri: 'http://192.168.56.1:3000/api/sciences', asset:'assets/science/chemistry.jpg'),
          ],
        ),
      ),
    );
  }
}

class AllCourses extends StatelessWidget {
  final String uri;
  final String asset;

  const AllCourses({Key? key, required this.uri, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: fetchCourses(uri),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<Course> courses = snapshot.data ?? [];
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseWidget(course: courses[index], asset: asset);
            },
          );
        }
      },
    );
  }
}

class CategoryCourses extends StatelessWidget {
  final String uri;
  final String asset;

  const CategoryCourses({Key? key, required this.uri, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: fetchCourses(uri),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<Course> courses = snapshot.data ?? [];
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseWidget(course: courses[index], asset: asset);
            },
          );
        }
      },
    );
  }
}

Future<List<Course>> fetchCourses(String uri) async {
  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    final List<dynamic> coursesJson = json.decode(response.body);
    List<Course> courses = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    return courses;
  } else {
    throw Exception('Failed to load courses');
  }
}

class CourseWidget extends StatefulWidget {
  final Course course;
  final String asset;

  const CourseWidget({Key? key, required this.course, required this.asset}) : super(key: key);

  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleCourse(course: widget.course, imageUrl: widget.asset),
          ),
        );

      },
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.31, // Adjust multiplier for desired size
              height: MediaQuery.of(context).size.height * 0.12, // Adjust multiplier for desired size
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust corner radius as needed
                image: DecorationImage(
                  image: AssetImage(widget.asset), // Use the provided asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      widget.course.title,
                      overflow: TextOverflow.ellipsis, // Truncate with '...' if exceeds space
                      maxLines: 2, // Adjust according to your UI
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 12,
                          color: Colors.blue,
                        ),
                        Text(
                          '2.2k',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.watch_later,
                          size: 15,
                        ),
                        Text(
                          '5 h',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              ),
              onPressed: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class Course {
  final String title;
  final String photo;
  final String views;
  final String duration;

  Course({
    required this.title,
    required this.photo,
    required this.views,
    required this.duration,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] ?? '', // Handle null values by providing a default value
      photo: json['photo'] ?? '', // Handle null values by providing a default value
      views: json['views'] ?? '', // Handle null values by providing a default value
      duration: json['duration'] ?? '', // Handle null values by providing a default value
    );
  }
}
