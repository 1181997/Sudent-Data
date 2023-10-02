import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentlist/add_student.dart';
import 'package:studentlist/first.dart';
import 'package:studentlist/student_list.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const StudentList(),
    );
  }
}
