import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_filter_icon.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:flutter/material.dart';
import 'p6_Employer_filter.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';

class p6_employer extends StatefulWidget {
  @override
  _p6_employerState createState() => _p6_employerState();
}

class _p6_employerState extends State<p6_employer> {
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employer");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppFilter(),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  'B.Tech',
                  'Male',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  'B.Tech',
                  'Male',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  'B.Tech',
                  'Male',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  'B.Tech',
                  'Male',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _white = Colors.white;
    return Container(
      alignment: Alignment.centerLeft,
      color: _white,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Search',
          prefixText: '  ',
        ),
      ),
    );
  }
}

Container container(
    BuildContext context,
    String name,
    String age,
    String skills,
    String qualification,
    String gender,
    String address,
    String contact) {
  var _blue = Colors.blue;
  var _white = Colors.white;
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Tooltip(
      message: 'Click to View Profile',
      child: RaisedButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        onPressed: () {},
        color: _blue,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$name',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Age: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$age',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Skills: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$skills',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Qualification : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$qualification',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Gender: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$gender',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Address: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$address',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Contact No. : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$contact',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
