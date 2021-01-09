import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'p6_Employer_filter.dart';

class AppFilter extends StatefulWidget {
  @override
  _AppFilterState createState() => _AppFilterState();
}

class _AppFilterState extends State<AppFilter> {
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
        icon: FaIcon(FontAwesomeIcons.filter),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilterPage(),
              ));
        },
        tooltip: 'Filters',
      ),
    );
  }
}
