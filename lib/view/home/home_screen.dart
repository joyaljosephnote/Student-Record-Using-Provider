import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/space.dart';
import 'package:student_provider/view/add_and_edit/student_add_and_edit_screen.dart';
import 'package:student_provider/view/home/widget/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: kgreenAccent,
      appBar: AppBar(
        backgroundColor: kgreenAccent,
        elevation: 0,
        title: const Text('Student Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              kheight5,
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: SizedBox(
                  height: 45,
                  child: CupertinoSearchTextField(
                    style: const TextStyle(color: kblack12),
                    controller: searchController,
                    onChanged: (value) {},
                  ),
                ),
              ),
              kheight5,
              Expanded(
                  child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
                itemBuilder: (context, index) {
                  return const CardWidget();
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentAddAndEdit(action: ActionType.add),
              ));
        },
        child: const Icon(CupertinoIcons.person_add),
      ),
    );
  }
}
