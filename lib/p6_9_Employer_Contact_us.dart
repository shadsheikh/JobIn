import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:flutter/material.dart';

class p6_9_Employer_Contact_us extends StatefulWidget {
  @override
  _p6_9_Employer_Contact_usState createState() => _p6_9_Employer_Contact_usState();
}

class _p6_9_Employer_Contact_usState extends State<p6_9_Employer_Contact_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Contact Us"
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed:(){},
          ),

          IconButton(
            icon: Icon(Icons.chat),
            onPressed:(){},
          ),

        ],
      ),
      drawer: EmployerDrawer(),
    );
  }
}
