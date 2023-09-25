import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/space.dart';
import 'package:student_provider/constants/style.dart';
import 'package:student_provider/controller/validator.dart';
import 'package:student_provider/view/add_and_edit/widget/student_profile_image.dart';

enum ActionType {
  add,
  edit,
}

ValueNotifier<File?> image = ValueNotifier<File?>(null);

class RegisterAddAndEditScreen extends StatelessWidget {
  final ActionType action;
  RegisterAddAndEditScreen({super.key, required this.action});
  final _formKey = GlobalKey<FormState>();

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
                    // controller: _nameController,
                    decoration: textFormFeild('Full Name'),
                  ),
                  kheight20,
                  TextFormField(
                    validator: (value) => nameValidator(value),
                    // controller: _parentsNameController,
                    decoration: textFormFeild('Parent Name'),
                  ),
                  kheight20,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => ageValidator(value),
                    // controller: _ageController,
                    decoration: textFormFeild('Age'),
                  ),
                  kheight20,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => mobileNumberValidator(value),
                    // controller: _mobileNumberController,
                    decoration: textFormFeild('Mobile Number'),
                  ),
                  kheight20,
                  FloatingActionButton.extended(
                    backgroundColor: const Color.fromARGB(255, 18, 133, 195),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // imageError();
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
}
