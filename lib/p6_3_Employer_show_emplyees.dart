import 'package:dsc_jobin/models/confirm_employee.dart';
import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:dsc_jobin/services/confirm_database.dart';
import 'package:dsc_jobin/services/confirm_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class p6_3_Employer_show_employee extends StatefulWidget {
  @override
  _p6_3_Employer_show_employeeState createState() =>
      _p6_3_Employer_show_employeeState();
}

class _p6_3_Employer_show_employeeState
    extends State<p6_3_Employer_show_employee> {
  Color _white = Colors.white;
  Color _blue = Colors.blue;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employees");
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Confirm>>.value(
        value:ConfirmService().confirm,
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
          body: ConfirmList(),
        ));
  }
}


