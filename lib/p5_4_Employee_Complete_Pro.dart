import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
class p5_4_employee_complete_pro extends StatefulWidget {
  @override
  _p5_4_employee_complete_proState createState() => _p5_4_employee_complete_proState();
}

class _p5_4_employee_complete_proState extends State<p5_4_employee_complete_pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Complete Your Profile"
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
