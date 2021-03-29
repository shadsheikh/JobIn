import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';
import 'package:dsc_jobin/p6_11_Employer_CompleteProfile.dart';
import 'package:dsc_jobin/p6_2_Employer_current_jobs.dart';
import 'package:dsc_jobin/p6_3_Employer_show_emplyees.dart';
import 'package:dsc_jobin/p6_4_Employer_chg_password.dart';
import 'package:dsc_jobin/p6_6_Employer_Applicant.dart';
import 'package:dsc_jobin/p6_8_Employer_Report.dart';
import 'package:dsc_jobin/p6_9_Employer_Con_Us.dart';
import 'package:dsc_jobin/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:dsc_jobin/p6_1_Employer_create_new_job.dart';

class EmployerDrawer extends StatefulWidget {
  @override
  _EmployerDrawerState createState() => _EmployerDrawerState();
}

class _EmployerDrawerState extends State<EmployerDrawer> {
  // final AuthService _auth = AuthService();
  final _authf = FirebaseAuth.instance;
  User user;
  String _userName, _pic = "";
  @override
  void initState() {
    super.initState();
    _getUserName();
    initUser();
  }

  Future<void> _getUserName() async {
    FirebaseFirestore.instance
        .collection('Employer')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value) {
      setState(() {
        _userName = value.data()['name'].toString();
        _pic = _userName.substring(0, 1).toUpperCase();
      });
    });
  }

  initUser() async {
    user = await _authf.currentUser;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "$_userName",
            ),
            accountEmail: Text("${user?.email}"),
            currentAccountPicture: CircleAvatar(
              child: Text(
                "$_pic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
              leading: Icon(Icons.messenger_outline),
              title: Text(
                "Applicant",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p6_6_Employer_Applicant(),
                    ));
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.open_in_new_outlined),
              title: Text(
                "Create New Job",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p6_1_employer_create_new_job(),
                    ));
              }),
          Divider(),
          // ListTile(
          //     leading: Icon(Icons.location_on_sharp),
          //     title: Text(
          //       "Current Jobs",
          //     ),
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => p6_2_emplooyer_current_jobs(),
          //           ));
          //     }),
          // Divider(),
          ListTile(
              leading: Icon(Icons.person_add),
              title: Text(
                "Complete Your Profile",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompleteProfile(),
                    ));
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.group_rounded),
              title: Text(
                "Show Employee",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p6_3_Employer_show_employee(),
                    ));
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.autorenew),
              title: Text(
                "Change Password",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p6_4_employer_chg_password(),
                    ));
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.report),
              title: Text(
                "Report",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportUser(),
                    ));
              }),
          Divider(),
          // ListTile(
          //     leading: Icon(Icons.contacts),
          //     title: Text(
          //       "Contact Us",
          //     ),
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ContactUs(),
          //           ));
          //     }),
          // Divider(),
          ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Log Out",
              ),
              onTap: () async {
                await _authf.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p3_employer_login(),
                    ));
              }),
        ],
      ),
    );
  }
}
