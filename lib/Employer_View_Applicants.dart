import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/p5_4_Employee_Complete_Pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/p5_Employee_Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'p6_Employer_drawer.dart';

class EmployerApplicants extends StatefulWidget {
  @override
  _employer_applicants createState() => _employer_applicants();
}
class _employer_applicants extends State<EmployerApplicants>{
  String name, email, address, city, state, user_uid, display = '';
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
        .collection('Employee')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value) {
      setState(() {
        name = value.data()['name'].toString();
        email = value.data()['email'].toString();
        address = value.data()['address'].toString();
        city = value.data()['city'].toString();
        state = value.data()['state'].toString();
        user_uid = FirebaseAuth.instance.currentUser.uid;

      });
    });
  }

  initUser() async {
    user = await _authf.currentUser;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    final Applicants applicants = ModalRoute.of(context).settings.arguments;
    String uid = applicants.user_uid;
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
                              'Name: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              applicants.name,
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
                              'Email: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${applicants.email}',
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
                              'Address: ',
                              style: TextStyle(
                                  color: _blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${applicants.address}',
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
                              '${applicants.city}',
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
                              '${applicants.state}',
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