import 'package:flutter/material.dart';
import 'dart:async';

class p6_4_employer_chg_password extends StatefulWidget {
  @override
  _p6_4_employer_chg_passwordState createState() => _p6_4_employer_chg_passwordState();
}

class _p6_4_employer_chg_passwordState extends State<p6_4_employer_chg_password> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  var _black = Colors.black;
  var _emailPhone = TextEditingController();
  var _verificationCode = TextEditingController();
  var _updatedPassword = TextEditingController();
  var _updatedPasswordVisible;
  var _enableButton;
  var _verificationVisible;
  var _password;
  Timer _timer;
  var _start = 30;
  @override
  void initState() {
    super.initState();
    _updatedPasswordVisible = false;
    _enableButton = false;
    _verificationVisible = false;
    _password = false;
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _blue,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment),
            tooltip: 'Chat',
            onPressed: () {},
          ),
        ],
        backgroundColor: _blue,
        elevation: 50.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        brightness: Brightness.dark,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: _blue,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Logo.png'),
                      radius: 70,
                    ),
                  ),
                  Text('Company Name',
                      style: TextStyle(color: _white, fontSize: 20))
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Applicants(0)',
                  style: TextStyle(color: _blue),
                ),
              //  onTap: () {
              //    Navigator.push(
              //        context,
               //       MaterialPageRoute(
               //         builder: (context) => Applicants(),
               //       ));
               // }
                ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Employees(0)',
                  style: TextStyle(color: _blue),
                ),
             //   onTap: () {
             //     Navigator.push(
             //         context,
             //         MaterialPageRoute(
            //            builder: (context) => Employee(),
             //         ));
             //   }
                ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Complete Your Profile',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Current Jobs(0)',
                  style: TextStyle(color: _blue),
                ),
              //  onTap: () {
              //    Navigator.push(
              //        context,
              //        MaterialPageRoute(
              //          builder: (context) => CurrentJob(),
              //        ));
              //  }
                ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Create New Job',
                style: TextStyle(color: _blue),
              ),
              /*
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewJob(),
                    ));
              },
            */
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Skills',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Change Password',
                style: TextStyle(color: _blue),
              ),
           /*   onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ));
              },

            */
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Report User',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
          ],
        ),
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: _white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailPhone,
                    decoration: InputDecoration(
                      fillColor: _white,
                      filled: true,
                      labelText: 'Email/Phone No.',
                      hintText: 'Enter Your Email/Phone No',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      prefixText: '  ',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: _black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        child: Text('Resend Code in ($_start)'),
                        onPressed: _enableButton ? () {} : null), //error hai
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      onPressed: () {
                        startTimer();
                        _verificationVisible = true;
                        setState(() {
                          if (_start == 0) {
                            _enableButton = true;
                          } else {
                            _enableButton = false;
                          }
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Employer(),
                        //     ));
                      },
                      child: Text(
                        'Send Code',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      color: _white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Divider(
                  color: _black,
                ),
                Visibility(
                  visible: (_verificationVisible) ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _verificationCode,
                      decoration: InputDecoration(
                        fillColor: _white,
                        filled: true,
                        labelText: 'Verification Code',
                        hintText: 'Enter Verification Code',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, bottom: 8.0, left: 12.0),
                          child: Icon(
                            Icons.vpn_key,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        prefixText: '  ',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: _black)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (_verificationVisible) ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: RaisedButton(
                        onPressed: () {
                          _password = true;
                        },
                        child: Text(
                          'Verify Code',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        color: _white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: _black,
                ),
                Visibility(
                  visible: (_password) ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _updatedPassword,
                      obscureText: !_updatedPasswordVisible,
                      decoration: InputDecoration(
                        fillColor: _white,
                        filled: true,
                        labelText: 'New Password',
                        hintText: 'Enter New Password',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, bottom: 8.0, left: 12.0),
                          child:Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        prefixText: '  ',
                        suffixText: ' ',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _updatedPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _updatedPasswordVisible =
                              !_updatedPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: _black)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (_password) ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: RaisedButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text('Password Changed Successfully!'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);

                          Future.delayed(const Duration(milliseconds: 1000),
                                  () {/*
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ));
                              */}

                              );
                        },
                        child: Text(
                          'Change Passsword',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        color: _white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
