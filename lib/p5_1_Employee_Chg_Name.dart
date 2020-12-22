import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
class p5_1_employee_chg_name extends StatefulWidget {
  @override
  _p5_1_employee_chg_nameState createState() => _p5_1_employee_chg_nameState();
}

class _p5_1_employee_chg_nameState extends State<p5_1_employee_chg_name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Your Name"
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
