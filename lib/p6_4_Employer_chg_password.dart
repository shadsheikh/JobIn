import 'package:dsc_jobin/p3_Employer_login.dart';
import 'package:dsc_jobin/p6_Employer.dart';
import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class p6_4_employer_chg_password extends StatefulWidget {
  @override
  _p6_4_employer_chg_passwordState createState() =>
      _p6_4_employer_chg_passwordState();
}

class _p6_4_employer_chg_passwordState
    extends State<p6_4_employer_chg_password> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  var _black = Colors.black;
  var _currentPassword = TextEditingController();
  var _updatedPassword = TextEditingController();
  var _currentPasswordVisible;
  var _updatedPasswordVisible;
  var _currentValidate=false;
  var _updateValidate=false;
  @override
  void initState() {
    super.initState();
    _currentPasswordVisible = false;
    _updatedPasswordVisible = false;
  }
  void dispose() {
    _currentPassword.dispose();
    _updatedPassword.dispose();
    super.dispose();
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Change Password");
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          AppNotification(),
          Chat(),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _currentPassword,
                obscureText: !_currentPasswordVisible,
                decoration: InputDecoration(
                  fillColor: _white,
                  filled: true,
                  labelText: 'Current Password',
                  hintText: 'Enter Current Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  prefixText: '  ',
                  errorText:
                  _currentValidate ? 'Value Can\'t Be Empty' : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _currentPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentPasswordVisible = !_currentPasswordVisible;
                      });
                    },
                  ),
                  border: new OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _updatedPassword,
                obscureText: !_updatedPasswordVisible,
                decoration: InputDecoration(
                  fillColor: _white,
                  filled: true,
                  labelText: 'Updated Password',
                  hintText: 'Enter Updated Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  prefixText: '  ',
                  errorText:
                  _updateValidate ? 'Value Can\'t Be Empty' : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _updatedPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _updatedPasswordVisible = !_updatedPasswordVisible;
                      });
                    },
                  ),
                  border: new OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.07,
                child: RaisedButton(
                  onPressed: () {

                    setState(() {
                      _currentPassword.text.isEmpty
                          ? _currentValidate = true
                          : _currentValidate = false;
                      _updatedPassword.text.isEmpty
                          ? _updateValidate = true
                          : _updateValidate = false;
                    }

                    );
                    if (_currentValidate==false && _updateValidate==false ) {
                      //CNGPASS();
                      Navigator.push(
                                context,
                                 MaterialPageRoute(
                                   builder: (context) => p6_employer(),
                                 ));
                    }
                    else {
                      print("Error");
                    }
                  },
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => p6_employer(),
                  //       ));
                  // },
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  color: _white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
