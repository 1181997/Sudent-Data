// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC8fmgxRuwFjrrAYLYj0h28sE8y0jr4QPY',
    appId: '1:684592204851:web:9986edf9d8fbad7a0de746',
    messagingSenderId: '684592204851',
    projectId: 'student-a933c',
    authDomain: 'student-a933c.firebaseapp.com',
    storageBucket: 'student-a933c.appspot.com',
    measurementId: 'G-P1M758YVPJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcN3O9syJscvWfJcfQ73k5wI-cnI2dU0E',
    appId: '1:684592204851:android:8a40951fce087a830de746',
    messagingSenderId: '684592204851',
    projectId: 'student-a933c',
    storageBucket: 'student-a933c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz_FKgOJp71_WaReRHdHCuYQvO5g62P-Y',
    appId: '1:684592204851:ios:af3576dc900fd2650de746',
    messagingSenderId: '684592204851',
    projectId: 'student-a933c',
    storageBucket: 'student-a933c.appspot.com',
    iosBundleId: 'com.example.studentlist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDz_FKgOJp71_WaReRHdHCuYQvO5g62P-Y',
    appId: '1:684592204851:ios:af3576dc900fd2650de746',
    messagingSenderId: '684592204851',
    projectId: 'student-a933c',
    storageBucket: 'student-a933c.appspot.com',
    iosBundleId: 'com.example.studentlist',
  );
}