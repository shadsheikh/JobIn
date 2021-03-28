import 'package:dsc_jobin/models/jobs_created.dart';
import 'package:dsc_jobin/p6_12_Applicant_Profile.dart';
import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_filter_icon.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:dsc_jobin/services/created_database.dart';
import 'package:dsc_jobin/services/created_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'p6_Employer_filter.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';

class p6_employer extends StatefulWidget {
  @override
  _p6_employerState createState() => _p6_employerState();
}

class _p6_employerState extends State<p6_employer> {
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employer");
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Created>>.value(
    value:CreatedService().created,
    child:Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cutSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Search",
                      border: new OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cutSearchBar = Text("Employer");
                }
              });
            },
            icon: cusIcon,
          ),
          AppNotification(),
          Chat(),
          AppFilter(),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: JobList(),
    ));
  }
}



