import 'package:dsc_jobin/p3_Employee_login.dart';
import 'package:dsc_jobin/p5_Employee.dart';
import 'package:dsc_jobin/p5_2_Employee_Job_Appl.dart';
import 'package:dsc_jobin/p5_3_Employee_My_Netw.dart';
import 'package:dsc_jobin/p5_4_Employee_Complete_Pro.dart';
import 'package:dsc_jobin/p5_5_Employee_Skill.dart';
import 'package:dsc_jobin/p5_7_Employee_Report.dart';
import 'package:dsc_jobin/p5_8_Employee_Con_us.dart';
import 'package:flutter/material.dart';
import 'p5_6_Employee_Chg_Pass.dart';
import 'package:dsc_jobin/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class p5_employee_drawer extends StatefulWidget {
  @override
  _p5_employee_drawerState createState() => _p5_employee_drawerState();
}

class _p5_employee_drawerState extends State<p5_employee_drawer> {
  final AuthService _auth = AuthService();
  final _authf = FirebaseAuth.instance;
  User user;
  String _userName, _pic = "";
  @override
  void initState() {
    super.initState();
    _getUserName();
    initUser();
  }
  Future<void> _getUserName() async{
    FirebaseFirestore.instance.collection('Employee')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value){
      setState(() {
        _userName = value.data()['name'].toString();
        _pic = _userName.substring(0,1).toUpperCase();
      });
    });
  }
  initUser() async{
    user = await _authf.currentUser;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //child: Column(
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
                "$_userName"
            ),
            accountEmail: Text(
                "${user?.email}"
            ),
            currentAccountPicture: CircleAvatar(
              child : Text(
                // "S"
                  "$_pic"
              ),
              backgroundColor: Colors.white,
            ),
          ),

          ListTile(
              leading : Icon(Icons.settings_applications),
              title : Text(
                "Job Applied",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_2_employee_job_appl(),
                    ));
              }
          ),

          Divider(),

          ListTile(
              leading : Icon(Icons.group),
              title : Text(
                "Jobs",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_employee(),
                    ));
              }
          ),

          Divider(),

          ListTile(
              leading : Icon(Icons.person_add),
              title : Text(
                "Complete Your Profile",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_4_employee_complete_pro(),
                    ));
              }
          ),

          Divider(),

          ListTile(
              leading : Icon(Icons.widgets_rounded),
              title : Text(
                "Skill",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_5_employee_skill(),
                    ));
              }
          ),

          Divider(),

          ListTile(
              leading : Icon(Icons.autorenew),
              title : Text(
                "Change Password",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_6_employee_chg_password(),
                    ));
              }
          ),


          Divider(),

          ListTile(
              leading : Icon(Icons.report),
              title : Text(
                "Report",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_7_employee_report(),
                    ));
              }
          ),

          Divider(),
          //Expanded(
          //child: Align(
          //alignment: Alignment.bottomCenter,
          ListTile(
              leading : Icon(Icons.contacts),
              title : Text(
                "Contact Us",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_8_employee_con_us(),
                    ));
              }
          ),

          Divider(),

          ListTile(
              leading : Icon(Icons.person),
              title : Text(
                "Log Out",
              ),
              onTap: () async{
                await _auth.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p3_employee_login(),
                    ));
              }
          ),
          //))

        ],
      ),
    );
  }
}
