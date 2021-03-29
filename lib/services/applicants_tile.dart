import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/p6_6_Employer_Applicant.dart';

class ApplicantsTile extends StatelessWidget {
  final Applicants applicants;
  ApplicantsTile({this.applicants});

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
                      'Name: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${applicants.name}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${applicants.email}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Address: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${applicants.address}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                      '${applicants.city}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'State: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${applicants.state}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
              ],
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width*0.8,
              buttonColor: Colors.white,
                child: RaisedButton(
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                    onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
