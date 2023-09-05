import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text, labelText;
  final int maxLines;

  const TextFieldWidget(
      {super.key,
        required this.controller,
        required this.text,
        this.maxLines = 1,
        required this.labelText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,

          //filled: true,
          // fillColor: const Color(0xffffffff),
          disabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color.fromRGBO(238, 238, 238, 1)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff506169)),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff506169),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}