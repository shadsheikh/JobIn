import 'package:dsc_jobin/p6_2_Employer_current_jobs.dart';
import 'package:dsc_jobin/p6_3_Employer_show_emplyees.dart';
import 'package:dsc_jobin/p6_4_Employer_chg_password.dart';
import 'package:dsc_jobin/p6_5_Employer_change_name.dart';
import 'package:dsc_jobin/p6_6_Employer_Applicant.dart';
import 'package:dsc_jobin/p6_7_Employer_Complete_Pro.dart';
import 'package:dsc_jobin/p6_8_Employer_Report.dart';
import 'package:dsc_jobin/p6_9_Employer_Contact_us.dart';
import 'package:flutter/material.dart';

import 'package:dsc_jobin/p6_1_Employer_create_new_job.dart';
class EmployerDrawer extends StatefulWidget {
  @override
  _EmployerDrawerState createState() => _EmployerDrawerState();
}

class _EmployerDrawerState extends State<EmployerDrawer> {
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
                        builder: (context) => p6_5_Employer_change_name(),
                      ));
                }
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.messenger_outline),
              title : Text(
                "Applicant",
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p6_6_Employer_Applicant(),
                      ));
                }
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.open_in_new_outlined),
              title : Text(
                "Create New Job",
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p6_1_employer_create_new_job(),
                      ));
                }
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.location_on_sharp),
              title : Text(
                "Current Jobs",
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p6_2_emplooyer_current_jobs(),
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
                        builder: (context) => p6_7_Employer_Complete_pro(),
                      ));
                }
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.group_rounded),
              title : Text(
                "Show Employee",
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p6_3_Employer_show_employee(),
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
                        builder: (context) => p6_4_employer_chg_password(),
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
                        builder: (context) => p6_8_Employer_Report(),
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
                              builder: (context) => p6_9_Employer_Contact_us(),
                            ));
                      }
                  ),
                ))

          ],
        ),
      );
  }
}