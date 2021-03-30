import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';

class EmployerTile extends StatelessWidget{
  final Employer employer;
  EmployerTile({this.employer});

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
                  employer.jobtitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                  'Vacancy: ${employer.vacancy}',

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
                child: const Text('More...',style: TextStyle(fontSize: 15),),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: ()
                  {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeJob(),
                          settings: RouteSettings(
                            arguments: this.employer,
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
