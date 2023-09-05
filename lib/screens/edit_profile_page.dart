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

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  final TextEditingController nameController = TextEditingController(),
      phoneController = TextEditingController(),
      faceController = TextEditingController(),
      instaController = TextEditingController(),
      whatsController = TextEditingController(),
      aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue.shade50,
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 40),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Title',
              text: user.title,
              onChanged: (title) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'WhatsApp',
              text: user.whats,
              onChanged: (whats) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'FaceBook',
              text: user.face,
              onChanged: (face) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Instagram',
              text: user.insta,
              onChanged: (insta) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'GitHub',
              text: user.git,
              onChanged: (git) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
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
                    user.name = nameController.text.toString();
                    user.phone = phoneController.text.toString();
                    user.whats = whatsController.text.toString();
                    user.face = faceController.text.toString();
                    user.insta = instaController.text.toString();
                    user.about = aboutController.text.toString();
                    /*if (image != null) {
                      user['profilePhoto'] = image!.path;
                    }
                    Hive.box('users').put(loggedUser, user);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      children: [Text('Your Informatiion saved successfully')],
                    )));
                    Navigator.of(context).pop();*/
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
      );
}
