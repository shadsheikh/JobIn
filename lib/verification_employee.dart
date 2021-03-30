import 'package:dsc_jobin/p3_Employee_login.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';

class VerificationEmployee extends StatefulWidget {
  @override
  _VerificationEmployeeState createState() => _VerificationEmployeeState();
}

class _VerificationEmployeeState extends State<VerificationEmployee> {
  var _blue = Colors.blue;
  var _white = Colors.white;
  var _otp = TextEditingController();
  var _otpValidate = false;
  @override
  void dispose() {
    _otp.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify OTP',
          style: TextStyle(color: _white, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _otp,
              decoration: InputDecoration(
                errorText: _otpValidate ? 'Value Can\'t Be Empty' : null,
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter OTP',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColorDark,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width*0.8,
              buttonColor: _white,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _otp.text.isEmpty
                        ? _otpValidate = true
                        : _otpValidate = false;
                  });
                  if (_otpValidate == false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => p3_employee_login(),
                        ));
                  } else {}
                },
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                      color: _blue, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
