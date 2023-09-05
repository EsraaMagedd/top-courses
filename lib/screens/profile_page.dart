
import 'package:top_courses/widgets/contact_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_courses/screens/user.dart';
import 'package:top_courses/screens/edit_profile_page.dart';
import 'package:top_courses/screens/user_preferences.dart';
import 'package:top_courses/widgets/appbar_widget.dart';
import 'package:top_courses/widgets/button_widget.dart';
import 'package:top_courses/widgets/numbers_widget.dart';
import 'package:top_courses/widgets/profile_widget.dart';
import 'package:top_courses/screens/user.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff046edb),
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          const SizedBox(height: 50),
          buildName(user),
          const SizedBox(height: 20),
          //Center(child: buildUpgradeButton()),
          //const SizedBox(height: 24),
          ContactWidget(),
          const SizedBox(height: 48),
          buildContact(user),
          const SizedBox(height: 24),
          buildAbout(user),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade50,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Color(0xff0497f5),),
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
    );
  }
  Widget buildName(User user) => Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 4),
          Text(
            user.title,
            style: TextStyle(color: Colors.grey,fontSize: 18),
          )
        ],
      );

  Widget buildContact(User user) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(children: [
              Icon(
                Icons.phone_outlined,
                color: Colors.black,
                size: 40,
              ),
              SizedBox(width: 10),
              InkWell(
                child: Text(
                  user.phone,
                  style: TextStyle(
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
              Icon(
                Icons.email_outlined,
                color: Colors.black,
                size: 40,
              ),
              SizedBox(width: 10),
              InkWell(
                child: Text(
                  user.email,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
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

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.about,
                  style: TextStyle(fontSize: 18, height: 1.4, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );

  calling() async {
    var url = "0109102129";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lanch $url';
    }
  }

  email() {
    launch(
        'mailto:sarasamir0105@gmail.com?subject=TestEmail&body=I am typing this test email%20plugin');
  }
}
