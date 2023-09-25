import 'dart:io';

class Student {
  int? id;
  String name;
  String parentName;
  String age;
  String mobileNumber;
  File? image;

  Student({
    required this.name,
    required this.parentName,
    required this.age,
    required this.mobileNumber,
    this.image,
    this.id,
  });

  static Student fromMap(Map<String, Object?> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
      parentName: map['parentName'] as String,
      age: map['age'] as String,
      mobileNumber: map['mobileNumber'] as String,
      image: map['image'] as String == '' ? null : File(map['image'] as String),
    );
  }
}
