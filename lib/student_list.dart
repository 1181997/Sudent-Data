import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentlist/add_student.dart';
import 'package:studentlist/student_model.dart';
import 'Edit_student_page.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> deleteStudent(String documentId) async {
    try {
      await _db.collection('students').doc(documentId).delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List'),),

      body:   StreamBuilder<QuerySnapshot>(
        stream: _db.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final students = snapshot.data?.docs;
          List<Widget> studentWidgets = [];
          for (var student in students!) {
            final studentData = student.data() as Map<String, dynamic>;
            final studentName = studentData!['name'] as String;
            final studentAge = studentData!['age'];
            final studentCourse = studentData['course'];
            final studentStandard = studentData['standard'];

            studentWidgets.add(
              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:
                      (context)=>EditStudentPage(studentId: student.id)));
                },
                title: Text('$studentName - $studentAge years'),
                subtitle: Text('Course: $studentCourse, Standard: $studentStandard'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:
                            (context) =>EditStudentPage(studentId: student.id)) );
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {
                        deleteStudent(student.id);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView(
            children: studentWidgets,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddStudent()));
      },
      child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
