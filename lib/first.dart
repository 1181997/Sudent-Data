import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studentlist/Edit_student_page.dart';


class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

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
  }



  Future<void> updateStudent(String documentId, Map<String, dynamic> updatedData) async {
    try {
      await _db.collection('students').doc(documentId).update(updatedData);
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            SizedBox(height: 16.0),
            Text(
              'Students',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

