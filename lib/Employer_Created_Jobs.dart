import 'package:dsc_jobin/models/jobs_created.dart';
import 'package:dsc_jobin/p5_4_Employee_Complete_Pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/p5_Employee_Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'p6_Employer_drawer.dart';

class EmployerCreated extends StatefulWidget {
  @override
  _employer_created createState() => _employer_created();
}
class _employer_created extends State<EmployerCreated>{
  String jobtitle, salary, skills, vacancy, jobmode, jobtype,city ,state,display = '',user_uid;
  final _authf = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  User user;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employer");
  var _blue = Colors.blue;
  @override
  void initState() {
    super.initState();
    _getData();
    initUser();
  }

  Future<void> _getData() async {
    FirebaseFirestore.instance
        .collection('Employer')
        .doc((await FirebaseAuth.instance.currentUser).uid).collection('Created_Jobs').doc()
        .get()
        .then((value) {
      setState(() {
        jobtitle = value.data()['Jobtitle'].toString();
        salary= value.data()['Salary'].toString();
        vacancy = value.data()['Vacancy'].toString();
        skills = value.data()['Skills'].toString();
        jobmode = value.data()['Job_Mode'].toString();
        user_uid = FirebaseAuth.instance.currentUser.uid;
        jobtype= value.data()['Job_Type'].toString();
        city= value.data()['City'].toString();
        state= value.data()['State'].toString();

      });
    });
  }

  initUser() async {
    user = await _authf.currentUser;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    final Created created = ModalRoute.of(context).settings.arguments;
    //String uid = created.user_uid;
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
                  this.cutSearchBar = Text("Employer");
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
        drawer: EmployerDrawer(),
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
                              'Jobtitle: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              created.jobtitle,
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
                              '${created.salary}',
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
                              '${created.vacancy}',
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
                              '${created.skills}',
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
                              'Job_Mode: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${created.jobmode}',
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
                              'Job_Type: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${created.jobtype}',
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
                              '${created.city}',
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
                              '${created.state}',
                              style: TextStyle(color: _blue, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                ],
              ),

            )));
  }

}