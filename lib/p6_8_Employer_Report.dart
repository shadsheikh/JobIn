import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:flutter/material.dart';

class ReportUser extends StatefulWidget {
  @override
  ReportUserState createState() => ReportUserState();
}

class ReportUserState extends State<ReportUser> {
  var _blue = Colors.blue;
  var _white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
        actions: <Widget>[
          AppNotification(),
          Chat(),
        ],
      ),
      drawer: EmployerDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: container(
                context,
                'Shane Smith',
                '25',
                'Electrician',
                'Higher Secondary',
                'Male',
                '123, Gumashta Nagar, Indore',
                '9876543210'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: container(context, 'George Warner', '35', 'Engineer', 'M.S.',
                'Male', '505, Saket Nagar, Indore', '9632587440'),
          ),
          Divider(),
        ],
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
    decoration:
        BoxDecoration(color: _blue, borderRadius: BorderRadius.circular(20.0)),
    width: MediaQuery.of(context).size.width * 0.9,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: _white,
              onPressed: () {},
              child: Text('Report Applicant'),
            ),
          ),
        )
      ],
    ),
  );
}
