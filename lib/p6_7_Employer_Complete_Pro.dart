import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:flutter/material.dart';
class p6_7_Employer_Complete_pro extends StatefulWidget {
  @override
  _p6_7_Employer_Complete_proState createState() => _p6_7_Employer_Complete_proState();
}

class _p6_7_Employer_Complete_proState extends State<p6_7_Employer_Complete_pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Complete Profile"
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
