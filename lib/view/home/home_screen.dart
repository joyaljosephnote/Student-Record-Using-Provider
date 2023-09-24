import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/space.dart';
import 'package:student_provider/view/home/widget/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        title: const Text('Student Register'),
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () {}, icon: const Icon(CupertinoIcons.person_add))
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: SizedBox(
                  height: 45,
                  child: CupertinoSearchTextField(
                    backgroundColor: kSerchBarColor,
                    style: const TextStyle(color: kwhite),
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
                  return CardWidget();
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.person_add),
      ),
    );
  }
}
