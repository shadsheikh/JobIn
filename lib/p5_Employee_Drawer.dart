import 'package:dsc_jobin/p5_1_Employee_Chg_Name.dart';
import 'package:dsc_jobin/p5_2_Employee_Job_Appl.dart';
import 'package:dsc_jobin/p5_3_Employee_My_Netw.dart';
import 'package:dsc_jobin/p5_4_Employee_Complete_Pro.dart';
import 'package:dsc_jobin/p5_5_Employee_Skill.dart';
import 'package:dsc_jobin/p5_7_Employee_Report.dart';
import 'package:dsc_jobin/p5_8_Employee_Con_us.dart';
import 'package:flutter/material.dart';
import 'p5_6_Employee_Chg_Pass.dart';
class p5_employee_drawer extends StatefulWidget {
  @override
  _p5_employee_drawerState createState() => _p5_employee_drawerState();
}

class _p5_employee_drawerState extends State<p5_employee_drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Shad Sheikh",
            ),
            accountEmail: Text(
                "shadsheikh3107@gmail.com"
            ),
            currentAccountPicture: CircleAvatar(
              child : Text(
                  "S"
              ),
              backgroundColor: Colors.white,
            ),
          ),

          ListTile(
            leading : Icon(Icons.person_add_outlined),
            title : Text(
              "Change Name",
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_1_employee_chg_name(),
                    ));
              }
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
              "My Network",
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p5_3_employee_my_netw(),
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
                      builder: (context) => p5_6_employee_chg_pass(),
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
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
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
              ))

        ],
      ),
    );
  }
}
