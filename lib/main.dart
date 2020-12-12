
import 'dart:io';

import 'package:dsc_jobin/P1_Internate_chack.dart';
import 'package:dsc_jobin/P2_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Internet Connection",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}