import 'package:flutter/material.dart';
import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApplicantProfile extends StatefulWidget {
  final name,
      age,
      skills,
      qualification,
      gender,
      contact,
      gmail,
      address,
      city,
      state,
      dob;

  ApplicantProfile(
      {Key key,
      this.name,
      this.age,
      this.skills,
      this.qualification,
      this.gender,
      this.contact,
      this.gmail,
      this.address,
      this.city,
      this.state,
      this.dob})
      : super(key: key);
  @override
  _ApplicantProfileState createState() => _ApplicantProfileState();
}

class _ApplicantProfileState extends State<ApplicantProfile> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}'s Profile"),
        actions: <Widget>[
          AppNotification(),
          Chat(),
        ],
      ),
      drawer: EmployerDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          padding(context, Icons.person, 'Name: ', widget.name),
          padding(context, Icons.calendar_today, 'Age: ', widget.age),
          padding(context, Icons.cake, 'Date of Birth: ', widget.dob),
          padding(context, Icons.widgets_rounded, 'Skills: ', widget.skills),
          padding(context, FontAwesomeIcons.graduationCap, 'Qualification: ',
              widget.qualification),
          padding(context, Icons.gps_fixed, 'Address: ', widget.address),
          padding(context, Icons.location_city, 'City: ', widget.city),
          padding(context, Icons.location_on_sharp, 'State: ', widget.state),
          padding(context, Icons.mail, 'E-Mail Id: ', widget.gmail),
          padding(context, Icons.phone, 'Contact No.: ', widget.contact),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonTheme(
                  buttonColor: _blue,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(color: _white),
                        ),
                        Icon(
                          Icons.send,
                          color: _white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  buttonColor: _white,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Back',
                          style: TextStyle(color: _blue),
                        ),
                        Icon(
                          Icons.arrow_left,
                          color: _blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Padding padding(BuildContext context, var icon, String key, String value) {
  var _blue = Colors.blue;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(4),
        2: FlexColumnWidth(4),
      },
     // border: TableBorder.all(width: 1.0, color: Colors.red),
      children: [
        TableRow(children: [
          Align(
            alignment: Alignment.centerLeft,
                      child: Icon(
              icon,
              color: _blue,
            ),
          ),
          Text(
            key,
            style: TextStyle(
                color: _blue, fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Text(
            value,
            style: TextStyle(color: _blue, fontSize: 20.0),
            textAlign: TextAlign.start,
          ),
        ]),
      ],
    ),
  );
}
// Icon(icon,color: _blue,),
//           Text(
//             key,
//             style: TextStyle(
//                 color: _blue, fontWeight: FontWeight.bold, fontSize: 20.0),
//           ),
//           Text(
//             value,
//             style: TextStyle(color: _blue, fontSize: 20.0),
//             textAlign: TextAlign.start,
//           ),
