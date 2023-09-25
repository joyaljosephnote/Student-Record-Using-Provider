import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/space.dart';
import 'package:student_provider/controller/provider/student_model_provider.dart';
import 'package:student_provider/view/add_and_edit/student_add_and_edit_screen.dart';
import 'package:student_provider/view/home/widget/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    context.read<StudentModelProvider>().getStudents('');
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
                    style: const TextStyle(color: kblack),
                    controller: searchController,
                    onChanged: (value) {
                      context.read<StudentModelProvider>().getStudents(value);
                    },
                  ),
                ),
              ),
              kheight5,
              Expanded(
                  child: Consumer<StudentModelProvider>(
                builder: (context, value, child) => GridView.builder(
                  itemCount: value.studentList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  itemBuilder: (context, index) {
                    return CardWidget(
                      studentModel: value.studentList[index],
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clear();
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
