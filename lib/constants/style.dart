import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';

TextStyle text20BlackBold = const TextStyle(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle text14BlackBold = const TextStyle(
    color: Colors.black, height: 2, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle textfeild = TextStyle(color: Colors.grey[400]);

InputDecoration textFormFeild(String labelText) {
  return InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    // filled: true,
    focusColor: Colors.amber,
    hintStyle: textfeild,
    fillColor: kwhite,
  );
}
