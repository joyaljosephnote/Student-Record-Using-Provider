// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/space.dart';
import 'package:student_provider/constants/style.dart';
import 'package:student_provider/controller/database/db_functions.dart';
import 'package:student_provider/controller/functions/validator.dart';
import 'package:student_provider/controller/provider/student_model_provider.dart';
import 'package:student_provider/model/student_model.dart';
import 'package:student_provider/view/add_and_edit/widget/student_profile_image.dart';

enum ActionType {
  add,
  edit,
}

ValueNotifier<File?> image = ValueNotifier<File?>(null);
final TextEditingController nameController = TextEditingController();
final TextEditingController parentNameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController mobileNumberController = TextEditingController();

class StudentAddAndEdit extends StatelessWidget {
  StudentAddAndEdit({super.key, required this.action, this.model});

  final ActionType action;
  final _formKey = GlobalKey<FormState>();
  final Student? model;
  final DB db = DB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreenAccent,
      appBar: AppBar(
        elevation: 0,
        title: action == ActionType.add
            ? const Text('Add Student')
            : const Text('Edit Student'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: image,
                    builder: (context, value, child) {
                      return GestureDetector(
                          onTap: () async {
                            await pickImage();
                          },
                          child: image.value != null
                              ? StudentProfileImage(
                                  radius: 60, image: image.value)
                              : const DefaultStudentProfileImage());
                    },
                  ),
                  kheight30,
                  TextFormField(
                    validator: (value) => nameValidator(value),
                    controller: nameController,
                    decoration: textFormFeild('Full Name'),
                  ),
                  kheight20,
                  TextFormField(
                    validator: (value) => nameValidator(value),
                    controller: parentNameController,
                    decoration: textFormFeild('Parent Name'),
                  ),
                  kheight20,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => ageValidator(value),
                    controller: ageController,
                    decoration: textFormFeild('Age'),
                  ),
                  kheight20,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => mobileNumberValidator(value),
                    controller: mobileNumberController,
                    decoration: textFormFeild('Mobile Number'),
                  ),
                  kheight20,
                  FloatingActionButton.extended(
                    backgroundColor: const Color.fromARGB(255, 18, 133, 195),
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final student = Student(
                          name: nameController.text.trim(),
                          parentName: parentNameController.text.trim(),
                          age: ageController.text.trim(),
                          mobileNumber: mobileNumberController.text.trim(),
                          image: image.value,
                        );
                        await context
                            .read<StudentModelProvider>()
                            .addOrEdit(student, action == ActionType.edit);
                        Navigator.of(context).pop();
                        clear();
                      }
                    },
                    label: action == ActionType.add
                        ? const Text('   SUBMIT STUDENT DATA  ')
                        : const Text('   UPDATE STUDENT DATA  '),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      image.value = File(img.path);
    }
  }

  setData(Student model) {
    nameController.text = model.name;
    parentNameController.text = model.parentName;
    ageController.text = model.age;
    mobileNumberController.text = model.mobileNumber;
    image.value = model.image;
  }

  clear() {
    nameController.text = '';
    parentNameController.text = '';
    ageController.text = '';
    mobileNumberController.text = '';
    image.value = null;
  }
}
