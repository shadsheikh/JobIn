import 'dart:io';
import 'package:dsc_jobin/p1_Internate_chack.dart';
import 'package:dsc_jobin/p2_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Internet Connection",
      debugShowCheckedModeBanner: false,
      home: p1_internet_check(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           print('${snapshot.error}');
//         }
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: "Internet Connection",
//             debugShowCheckedModeBanner: false,
//             home: p1_internet_check(),
//           );
//         }
//
//         // Otherwise, show something whilst waiting for initialization to complete
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }