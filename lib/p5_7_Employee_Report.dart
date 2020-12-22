import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
class p5_7_employee_report extends StatefulWidget {
  @override
  _p5_7_employee_reportState createState() => _p5_7_employee_reportState();
}

class _p5_7_employee_reportState extends State<p5_7_employee_report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Report"
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
      drawer: p5_employee_drawer(),
    );
  }
}
