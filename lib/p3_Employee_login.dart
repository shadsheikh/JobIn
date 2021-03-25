import 'package:dsc_jobin/p4_signin.dart';
import 'package:dsc_jobin/p5_Employee.dart';
import 'package:dsc_jobin/p6_Employer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc_jobin/services/auth.dart';

class p3_employee_login extends StatefulWidget {
  @override
  _p3_employee_loginState createState() => _p3_employee_loginState();
}

class _p3_employee_loginState extends State<p3_employee_login> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  var _black = Colors.black;
  var _passwordVisible;
  var _email = TextEditingController();
  var _password = TextEditingController();
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Log In",
        )),
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            fillColor: _white,
                            filled: true,
                            labelText: 'Email/Contact No.',
                            hintText: 'Enter Your Email/Contact No',
                            prefixIcon: Icon(
                              Icons.person,
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
                        child: TextFormField(
                          controller: _password,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            fillColor: _white,
                            filled: true,
                            labelText: 'Password/OTP',
                            hintText: 'Enter Your Password/OTP',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            prefixText: '  ',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            border: new OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Forget Password'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => singin(),
                                  ));
                            },
                            child: Text('Sign Up'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: RaisedButton(
                            onPressed: () async {
                              dynamic result =
                                  await _auth.signInwithEmailAndPassword(
                                      _email.text, _password.text);
                              if (result == null) {
                                setState(() {
                                  final snackBar = SnackBar(
                                    content: Text('Invalid username/password'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => p5_employee(),
                                    ));
                              }
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            color: _white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
