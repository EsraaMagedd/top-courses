import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          //scrollDirection: Axis.horizontal,
          //shrinkWrap: true,
          //direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 20,
          runSpacing: 10,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffef4881)),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    launchInstagram();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff0576d4)),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    urlLaunch();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              width: 55,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    whatsapp();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff464343)),
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: InkResponse(
                  onTap: () {
                    urlGitLaunch();
                  },
                  splashColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        )
      ]);

  whatsapp() async {
    await launch('https://wa.me/+201091021298?text=hello');
  }

  urlLaunch() async {
    const url = 'https://www.facebook.com/profile.php?id=100018326168342';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  urlGitLaunch() async {
    const url = 'https://github.com/EsraaMagedd';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  launchInstagram() async {
    const nativeUrl = "instagram://user?username=severinas_app";
    const webUrl = "https://www.instagram.com/severinas_app/";
    if (await canLaunch(nativeUrl)) {
      await launch(nativeUrl);
    } else if (await canLaunch(webUrl)) {
      await launch(webUrl);
    } else {
      print("can't open Instagram");
    }
  }
}
