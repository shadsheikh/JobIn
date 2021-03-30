import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/p5_Employee_Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
DocumentReference docref;
class EmployeeJob extends StatefulWidget {
  @override
  _employee_jobState createState() => _employee_jobState();
}

class _employee_jobState extends State<EmployeeJob> {
//class EmployeeJob extends StatelessWidget{
  String name1, address, state, city, email, user_uid, display = '';
  final _authf = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  User user;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employee");
  var _blue = Colors.blue;
  @override
  void initState() {
    super.initState();
    _getData();
    initUser();
  }

  Future<void> _getData() async {
    FirebaseFirestore.instance
        .collection('Employee')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value) {
      setState(() {
        name1 = value.data()['name'].toString();
        address = value.data()['address'].toString();
        city = value.data()['city'].toString();
        state = value.data()['state'].toString();
        user_uid = FirebaseAuth.instance.currentUser.uid;
        email = value.data()['email'].toString();
      });
    });
  }

  initUser() async {
    user = await _authf.currentUser;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    final Employer employer = ModalRoute.of(context).settings.arguments;
    String uid = employer.user_uid;
    int count;
    var _jobType = employer.jobtype;
    var _jobMode = employer.jobmode;

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
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //setState(() {
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
                  this.cutSearchBar = Text("Employee");
                }
                // });
              },
              icon: cusIcon,
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {},
            ),
          ],
          title: cutSearchBar,
        ),
        drawer: p5_employee_drawer(),
        body: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 30.0),
              child: Column(
                children: [
                  Table(
                    columnWidths: {
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(4),
                    },
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Job Title: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              employer.jobtitle,
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Vacancy: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${employer.vacancy}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Skills: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${employer.skills}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Job Type: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$_jobType',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Job Mode: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '$_jobMode',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'State: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${employer.state}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Salary: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${employer.salary}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'City: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${employer.city}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text('Apply'),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("Employee")
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection("JOB_Applied")
                              .add(
                              {
                                "jobtittle": employer.jobtitle,
                                "skills": employer.skills,
                                "vaccancy": employer.vacancy,
                                "jobtype": employer.jobtype,
                                "jobmode": employer.jobmode,
                                "state": employer.state,
                                "city": employer.city,
                                "uid": employer.user_uid,
                              }
                          ).then((value) {});
                          var highlight=false;
                          dynamic result = FirebaseFirestore.instance
                              .collection("Employer")
                              .doc(uid)
                              .collection("JOB_Apply")
                              .add({
                            "name": name1,
                            "user_uid": user_uid,
                            "city": city,
                            "state": state,
                            "email": email,
                            "address": address,
                            "highlight": highlight,
                          }).then((value) {print(value); docref=value;});

                          final snackbar =
                          SnackBar(content: Text('Applied Successfully'));
                          _scaffoldkey.currentState.showSnackBar(snackbar);
                        }

                      ),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),


            )));
    }
  }
