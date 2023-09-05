import 'dart:io';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_courses/screens/profile_page.dart';
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

import '../widgets/textfield_widget.dart';

import '../main.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      titleController = TextEditingController(),
      phoneController = TextEditingController(),
      faceController = TextEditingController(),
      instaController = TextEditingController(),
      whatsController = TextEditingController(),
      aboutController = TextEditingController();

  void initState() {
    emailController.text = loggedUser;
    titleController.text = user['title'];
    nameController.text = user['name'];
    phoneController.text = user['phone'];
    aboutController.text = user['about'];
    faceController.text = user['face'];
    whatsController.text = user['whats'];
    instaController.text = user['insta'];
    super.initState();
  }

  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: buildAppBar(context),
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
            const SizedBox(height: 20),
            TextFieldWidget(
              labelText: 'Full Name',
              text: user["name"],
              controller: nameController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'Title',
              text: user["title"],
              controller: titleController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'Email',
              text: loggedUser,
              controller: emailController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'WhatsApp',
              text: user["whats"],
              controller: whatsController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'FaceBook',
              text: user["face"],
              controller: faceController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'Instagram',
              text: user["insta"],
              controller: instaController,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'GitHub',
              text: "https://github.com/EsraaMagedd",
              controller: TextEditingController(),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              labelText: 'About',
              text: user["about"],
              maxLines: 5,
              controller: aboutController,
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff046edb),
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  setState(() {
                    user['name'] = nameController.text.toString();
                    user['title'] = titleController.text.toString();
                    user['phone'] = phoneController.text.toString();
                    user['whats'] = whatsController.text.toString();
                    user['face'] = faceController.text.toString();
                    user['insta'] = instaController.text.toString();
                    user['about'] = aboutController.text.toString();
                    if (image != null) {
                      user['prof'] = image!.path;
                    }
                    Hive.box('user').put(loggedUser, user);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        content: Row(
                          children: [
                            Text(
                              'Your Informatiion saved successfully',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )));
                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}