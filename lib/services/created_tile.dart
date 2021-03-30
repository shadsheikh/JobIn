import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/jobs_created.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/Employee_View_Job.dart';
import 'package:dsc_jobin/p6_6_Employer_Applicant.dart';

class JobTile extends StatefulWidget {
  final Created created;

  JobTile({this.created});

  @override
  _JobTileState createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> {
  @override
  Widget build(BuildContext context) {
    var _jobType = widget.created.jobtype;
    var _jobMode = widget.created.jobmode;

    if (_jobType == "JobType.partTime") {
      _jobType = "Part Time";
    } else {
      _jobType = "Full Time";
    }
    if (_jobMode == "JobMode.online") {
      _jobMode = "Online";
    } else {
      _jobMode = "Offline";
    }
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
                      'Jobtitle: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.created.jobtitle}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Salary: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.created.salary}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                      '${widget.created.vacancy}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Skills: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.created.skills}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'JobMode: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${_jobMode}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'JobType: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${_jobType}',
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
                      '${widget.created.city}',
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
                      '${widget.created.state}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
