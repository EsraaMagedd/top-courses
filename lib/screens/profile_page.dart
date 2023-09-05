
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hive/hive.dart';
import 'package:top_courses/screens/saved.dart';
import 'package:top_courses/widgets/contact_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_courses/screens/user.dart';
import 'package:top_courses/screens/home.dart';
import 'package:top_courses/screens/edit_profile_page.dart';
import 'package:top_courses/screens/user_preferences.dart';
import 'package:top_courses/widgets/appbar_widget.dart';
import 'package:top_courses/widgets/button_widget.dart';
import 'package:top_courses/widgets/numbers_widget.dart';
import 'package:top_courses/widgets/profile_widget.dart';
import 'package:top_courses/screens/user.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

late var user;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    user = Hive.box("user").get(loggedUser);
    //print(user.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff046edb),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff046edb),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: user['prof'] ==
                                'https://i.pinimg.com/474x/32/1b/41/321b41a8e7cad9a27d8e1e5b5e104a68.jpg'
                                ? Image.network(
                              user['prof'],
                              fit: BoxFit.cover,
                              width:
                              MediaQuery.of(context).size.width / 3,
                              height:
                              MediaQuery.of(context).size.width / 3,
                            )
                                : Image.file(
                              File(user['prof']),
                              fit: BoxFit.cover,
                              width:
                              MediaQuery.of(context).size.width / 3,
                              height:
                              MediaQuery.of(context).size.width / 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 150),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff046edb),
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            buildName(),
            const SizedBox(height: 20),
            //Center(child: buildUpgradeButton()),
            //const SizedBox(height: 24),
            ContactWidget(),
            const SizedBox(height: 48),
            buildContact(),
            const SizedBox(height: 24),
            buildAbout(),
          ],
        ),
      ),
      /*   bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade50,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Color(0xff0497f5),
            ),
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
      ),*/
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue.shade50,
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

          /* Icon(
            Icons.menu,
            size: 30,
            color: Color(0xff046edb),
          ),*/
        ],
        onTap: (index) {
          setState(() {});
        },
      ),
    );
  }

  Widget buildName() => Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      Text(
        user["name"],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      const SizedBox(height: 4),
      Text(
        user["title"],
        style: const TextStyle(color: Colors.grey, fontSize: 18),
      )
    ],
  );

  Widget buildContact() => Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Row(children: [
          const Icon(
            Icons.phone_outlined,
            color: Colors.black,
            size: 40,
          ),
          const SizedBox(width: 10),
          InkWell(
            child: Text(
              user["phone"],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            onTap: () {
              calling();
            },
          ),
        ]),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Row(children: [
          const Icon(
            Icons.email_outlined,
            color: Colors.black,
            size: 40,
          ),
          const SizedBox(width: 10),
          InkWell(
            child: Text(
              loggedUser,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            onTap: () {
              email();
            },
          ),
        ]),
      ),
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Edit Ptofile',
    onClicked: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditProfilePage()),
      );
    },
  );

  Widget buildAbout() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user["about"],
              style: const TextStyle(
                  fontSize: 18, height: 1.4, color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );

  calling() async {
    var url = user["phone"];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lanch $url';
    }
  }

  email() {
    launch(loggedUser);
  }
}