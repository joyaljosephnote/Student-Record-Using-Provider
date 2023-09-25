// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_provider/model/student_model.dart';

class DB with ChangeNotifier {
  //private constructor
  DB._();

  //Singleton instance variable
  static final DB _instance = DB._();

  // Factory constructor to return the singleton instance
  factory DB() => _instance;

  late Database db;

  Future initialiseDatabase() async {
    db = await openDatabase('student.db',
        version: 1,
        onCreate: ((db, version) async => await db.execute(
            'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, parentName TEXT, age TEXT, mobileNumber TEXT, image TEXT)')));
  }

  Future<bool> insertInToDb(Student model) async {
    try {
      String image = model.image == null ? '' : model.image!.path;
      db.rawInsert(
          'INSERT INTO Student(name,parentName, age, mobileNumber, image) VALUES(?,?,?,?,?)',
          [model.name, model.parentName, model.age, model.mobileNumber, image]);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<Student>> getData() async {
    List<Student> studentList = [];
    List<Map<String, Object?>> list =
        await db.rawQuery('SELECT * FROM Student');
    for (var map in list) {
      final student = Student.fromMap(map);
      print(student.name);
      studentList.add(student);
    }
    return studentList;
  }

  Future<bool> updateTable(Student model) async {
    try {
      String image = model.image == null ? '' : model.image!.path;
      await db.rawUpdate(
          'UPDATE Student SET name = ?, parentName = ?, age = ?, mobileNumber =?, image =? WHERE id = ?',
          [
            model.name,
            model.parentName,
            model.age,
            model.mobileNumber,
            image,
            model.id
          ]);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> deleteData(int id) async {
    await db.delete(
      'Student',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
