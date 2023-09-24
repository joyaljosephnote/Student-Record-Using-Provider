import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/screen_size.dart';
import 'package:student_provider/constants/style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSerchBarColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: kwhite,
            // backgroundImage: FileImage(File(student.image)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                child: Text(
              'Name : Joyal',
              style: text14WhiteBold,
            )),
          ),
        ],
      ),
    );
  }
}
