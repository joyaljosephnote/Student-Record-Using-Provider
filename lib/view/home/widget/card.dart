import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/style.dart';
import 'package:student_provider/view/add_and_edit/register_add_and_edit_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RegisterAddAndEditScreen(action: ActionType.edit),
          )),
      child: Card(
        color: kblack12,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: kwhite,
              radius: 50,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/studentImage.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  child: Text(
                'Name : Joyal',
                style: text14BlackBold,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
