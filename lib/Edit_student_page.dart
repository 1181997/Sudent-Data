import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditStudentPage extends StatefulWidget {
  final String studentId;

  EditStudentPage({required this.studentId});

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _standardController = TextEditingController();



  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  Future<void> fetchStudentData() async {
    try {
      DocumentSnapshot studentSnapshot = await _db
          .collection('students')
          .doc(widget.studentId)
          .get();

      if (studentSnapshot.exists) {
        final studentData = studentSnapshot.data() as Map<String, dynamic>;
        _nameController.text = studentData['name'] ?? '';
        _ageController.text = (studentData['age'] ?? 0).toString();
        _courseController.text = studentData['course'] ?? '';
        _standardController.text = (studentData['standard'] ?? 0).toString();
      }
    } catch (e) {
      print('Error fetching student data: $e');
    }
  }

  Future<void> updateStudent() async {
    try {
      await _db.collection('students').doc(widget.studentId).update({
        'name': _nameController.text,
        'age': int.parse(_ageController.text),
        'course': _courseController.text,
        'standard': int.parse(_standardController.text),
      });
      Navigator.pop(context);
    } catch (e) {
      print('Error updating student data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
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
                updateStudent();
              },
              child: Text('Update Student'),
            ),

          ],
        ),
      ),
    );
  }
}
