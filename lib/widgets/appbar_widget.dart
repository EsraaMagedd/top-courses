import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: Colors.white,
    ),
    backgroundColor: Color(0xff046edb),
    elevation: 0,
  );
}
