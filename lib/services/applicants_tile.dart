import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/confirm_employee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/p6_6_Employer_Applicant.dart';

import 'confirm_tile.dart';

class ApplicantsTile extends StatefulWidget {
  final Applicants applicants;
  ApplicantsTile({this.applicants});
  //final Confirm confirm;
  //ConfirmTile({this.confirm});
  @override
  _ApplicantsTileState createState() => _ApplicantsTileState();
}

class _ApplicantsTileState extends State<ApplicantsTile> {

  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
    var _highlight=widget.applicants.highlight;
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
                      '${widget.applicants.name}',
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
                      '${widget.applicants.email}',
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
                      '${widget.applicants.address}',
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
                      '${widget.applicants.city}',
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
                      '${widget.applicants.state}',
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
                    onPressed: () {
                      widget.applicants.highlight=true;
                      FirebaseFirestore.instance
                          .collection("Employer")
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .collection("Confirm_Employee")
                          .add(
                          {
                            "name": widget.applicants.name,
                            "email": widget.applicants.email,
                            "address": widget.applicants.address,
                            "city": widget.applicants.city,
                            "state": widget.applicants.state,
                            "highlight":widget.applicants.highlight,
                          }
                      ).then((value) {
                        setState(() {
                          final snackBar = SnackBar(
                            content: Text('Confirmed Employee'),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        });
                      });

                    }))
          ],
        ),
      ),
    );
  }
}
