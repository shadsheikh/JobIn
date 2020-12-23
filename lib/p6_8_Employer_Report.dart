import 'package:dsc_jobin/p6_Employer_chat.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification.dart';
import 'package:flutter/material.dart';

class p6_8_Employer_Report extends StatefulWidget {
  @override
  _p6_8_Employer_ReportState createState() => _p6_8_Employer_ReportState();
}

class _p6_8_Employer_ReportState extends State<p6_8_Employer_Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Report"
        ),
        actions: <Widget>[
          AppNotification(),
          Chat(),

        ],
      ),
      drawer: EmployerDrawer(),
    );
  }
}
