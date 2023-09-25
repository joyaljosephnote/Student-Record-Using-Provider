import 'package:flutter/material.dart';
import 'package:student_provider/controller/database/db_functions.dart';
import '../../model/student_model.dart';

class StudentModelProvider with ChangeNotifier {
  DB sql = DB();
  List<Student> studentList = [];

  Future<void> getStudents(String name) async {
    List<Student> tempList = await sql.getData();
    studentList = tempList
        .where((model) => model.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addOrEdit(Student model, bool toEdit) async {
    toEdit ? await editModel(model) : await addModel(model);
  }

  Future<void> deleteModel(int id) async {
    await sql.deleteData(id);
    await getStudents('');
  }

  Future<void> addModel(Student model) async {
    await sql.insertInToDb(model);
    await getStudents('');
  }

  Future<void> editModel(Student model) async {
    await sql.updateTable(model);
    await getStudents('');
  }
}
