import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
class p5_8_employee_con_us extends StatefulWidget {
  @override
  _p5_8_employee_con_usState createState() => _p5_8_employee_con_usState();
}

class _p5_8_employee_con_usState extends State<p5_8_employee_con_us> {
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
      drawer: p5_employee_drawer(),
    );
  }
}
