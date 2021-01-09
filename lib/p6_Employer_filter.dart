import 'package:dsc_jobin/p6_Employer_filter_catagory.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Color _white = Colors.white;
  Color _blue = Colors.blue;
  var _grey = Colors.grey[600];
  bool _workFromHome = false;
  bool _partTime = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _blue,
        title: Text('Filters'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SKILLS',
              style: TextStyle(color: _grey, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [],
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.add,
              color: _blue,
            ),
            padding: EdgeInsets.zero,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterCatagory(),
                  ));
            },
            label: Text(
              'Add Skill',
              style: TextStyle(color: _blue),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'CITY',
              style: TextStyle(color: _grey, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [],
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.add,
              color: _blue,
            ),
            padding: EdgeInsets.zero,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {},
            label: Text(
              'Add City',
              style: TextStyle(color: _blue),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'JOB TYPE',
              style: TextStyle(color: _grey, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Work From Home'),
                Switch(
                  activeColor: _blue,
                  value: _workFromHome,
                  onChanged: (bool val) {
                    setState(() {
                      _workFromHome = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Part-time'),
                Switch(
                  activeColor: _blue,
                  value: _partTime,
                  onChanged: (bool val) {
                    setState(() {
                      _partTime = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Text('Apply'),
                textColor: _white,
                color: _blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
