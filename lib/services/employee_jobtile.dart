import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/services/employee_view_job_applied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employee.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/services/database.dart';

class EmployeeTile extends StatelessWidget{
  final Employee employee;
  EmployeeTile({this.employee});

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            color: Colors.blue,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Column(
                children: <Widget>[
                  //ListTileTheme(
                  //textColor: Colors.white,

                  ListTile(
                    title: Text(
                      employee.jobtitle,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Vacancy: ${employee.vacancy}',

                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('...more',style: TextStyle(fontSize: 15),),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: ()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => job_applied(),
                                    settings: RouteSettings(
                                      arguments: this.employee,
                                    )
                                ));

                          },
                        ),
                        const SizedBox(width: 8),
                      ]
                  )
                ]
            )
        )
    );
  }
}