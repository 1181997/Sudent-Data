import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentlist/student_list.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _standardController = TextEditingController();

  Future<void> addStudent() async {
    await _db.collection('students').add({
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
      'course': _courseController.text,
      'standard': int.parse(_standardController.text),
    });
    _nameController.clear();
    _ageController.clear();
    _courseController.clear();
    _standardController.clear();

    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(

              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _courseController,
              decoration: InputDecoration(labelText: 'Course'),
            ),
            TextFormField(
              controller: _standardController,
              decoration: InputDecoration(labelText: 'Standard'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addStudent();

              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
