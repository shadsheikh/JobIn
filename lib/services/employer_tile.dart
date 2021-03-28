import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';

class EmployerTile extends StatelessWidget {
  final Employer employer;
  EmployerTile({this.employer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        //color: Colors.blue,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
                color: Colors.lightBlue, // set border color
                width: 3.0), // set border width
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)), // set rounded corner radius
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black, offset: Offset(1, 3))
            ] // make rounded corner of border
            ),
        child: Column(
          children: [
            Table(
              columnWidths: {
                0: FlexColumnWidth(5),
                1: FlexColumnWidth(5),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Job: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${employer.jobtitle}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Vacancy: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${employer.vacancy}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'City: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${employer.city}',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: const Text(
                      'More...',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeJob(),
                              settings: RouteSettings(
                                arguments: this.employer,
                              )));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      /*child: Card(
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
                child: const Text('...more',style: TextStyle(fontSize: 15),),
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
      )*/
    );
  }
}
