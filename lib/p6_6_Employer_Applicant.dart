import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/p6_12_Applicant_Profile.dart';
import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:dsc_jobin/services/applicants_database.dart';
import 'package:dsc_jobin/services/applicants_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class p6_6_Employer_Applicant extends StatefulWidget {
  @override
  _p6_6_Employer_ApplicantState createState() =>
      _p6_6_Employer_ApplicantState();
}

class _p6_6_Employer_ApplicantState extends State<p6_6_Employer_Applicant> {

  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Applicants");
  User user;
  @override

  Widget build(BuildContext context) {
    return StreamProvider<List<Applicants>>.value(
      value:DataService().applicants,
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
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: ApplicantsList(),
    ));
  }
}

