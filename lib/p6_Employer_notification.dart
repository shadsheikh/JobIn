import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var _blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: _blue,
        elevation: 50.0,
        brightness: Brightness.dark,
        actions: <Widget>[
          Chat(),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recent',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          padding('John Smith', 'Programmer'),
          Divider(),
          padding('Shane Wade', 'Teacher'),
          Divider(),
          padding('Joe Wilson', 'Doctor'),
          Divider(),
          padding('Jimmy K.', 'Electrician'),
          Divider(),
          padding('Carl Root', 'Plumber'),
          Divider(),
          padding('Darrel Cook', 'Press Man'),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Earlier',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          padding('Dave Haster', 'Painter'),
          Divider(),
          padding('Ivy Johnson', 'Sales Man'),
          Divider(),
          padding('Jack Henry', 'Milk Man'),
          Divider(),
          padding('Bill Shaw', 'Tester'),
          Divider(),
        ],
      ),
    );
  }
}

Padding padding(String name, String post) {
  var _white = Colors.white;
  var _black = Colors.black;
  var _blue = Colors.blue;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Tooltip(
      message: 'Click to view profile of $name',
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: _blue)),
        child: ListTile(
          tileColor: _white,
          leading: Icon(
            Icons.person,
            color: _black,
          ),
          title: RichText(
            text: new TextSpan(
              style: TextStyle(fontSize: 18.0, color: _black),
              children: [
                new TextSpan(
                    text: '$name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                  text: ' has applied for ',
                ),
                new TextSpan(
                    text: '$post\'s',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                  text: ' post.',
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    ),
  );
}
