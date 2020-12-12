import 'package:flutter/material.dart';
import 'p3_login.dart';

class p2_option extends StatefulWidget {
  @override
  _p2_optionState createState() => _p2_optionState();
}

class _p2_optionState extends State<p2_option> {
  Color _white = Colors.white;
  Color _blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blue,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'JobsIn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            sizedBox(context, 0.1),
            buttonTheme(context, 0.95, 0.07, 'Employee', _white, 25.0, 20.0),
            sizedBox(context, 0.1),
            buttonTheme(context, 0.95, 0.07, 'Employer', _white, 25.0, 20.0),
            sizedBox(context, 0.1),
            buttonTheme(context, 0.95, 0.07, 'Admin', _white, 25.0, 20.0),
          ],
        ),
      ),
    );
  }
}

SizedBox sizedBox(BuildContext context, double h) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * h,
  );
}

ButtonTheme buttonTheme(BuildContext context, double width, double height,
    String text, Color color, double fontSize, double radius) {
  return ButtonTheme(
    minWidth: MediaQuery.of(context).size.width * width,
    height: MediaQuery.of(context).size.height * height,
    child: RaisedButton(
      color: color,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
      },
      child: Text(
        '$text',
        style: TextStyle(fontSize: fontSize),
      ),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    ),
  );
}
