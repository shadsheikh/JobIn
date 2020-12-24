import 'package:dsc_jobin/p6_Employer_notification.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class AppNotification extends StatefulWidget {
  @override
  _AppNotificationState createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification> {
  int _counter = 10;
  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      badgeColor: Colors.white,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      child: IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Notifications(),
              ));
        },
        tooltip: 'Notifications',
      ),
    );
  }
}
