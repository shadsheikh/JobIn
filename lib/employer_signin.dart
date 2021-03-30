import 'package:dsc_jobin/p2_options.dart';
import 'package:dsc_jobin/verification_employer.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';
import 'package:dsc_jobin/p3_Employee_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/services/auth.dart';
import 'package:email_auth/email_auth.dart';

class sign12 extends StatefulWidget {
  @override
  _sign12State createState() => _sign12State();
}

class _sign12State extends State<sign12> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email, password, address, name, city, state, id;
  String error = '';
  var _name = TextEditingController();
  var _password = TextEditingController();
  var _email = TextEditingController();
  var _address = TextEditingController();
  var _city = TextEditingController();
  var _state = TextEditingController();
  var _id = TextEditingController();
  var _otp = TextEditingController();
  var _passwordVisible;
  var _passwordValidate = false;
  var _nameValidate = false;
  var _emailValidate = false;
  var _addressValidate = false;
  var _cityValidate = false;
  var _stateValidate = false;
  var _idValidate = false;
  var _otpValidate = false;

  @override
  void dispose() {
    _name.dispose();
    _password.dispose();
    _email.dispose();
    _address.dispose();
    _city.dispose();
    _state.dispose();
    _id.dispose();
    super.dispose();
  }

  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    void sendOTP() async {
      EmailAuth.sessionName = "JobIn";
      var res = await EmailAuth.sendOtp(receiverMail: _email.text);
      if (res) {
        setState(() {
          final snackBar = SnackBar(
            content: Text('OTP Sent Successfully.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      } else {
        setState(() {
          final snackBar = SnackBar(
            content: Text('Invalid Email address'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    }

    bool verifyOTP() {
      var res =
          EmailAuth.validate(receiverMail: _email.text, userOTP: _otp.text);
      if (res) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
        "Sign Up",
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  //Name
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _name,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        errorText:
                            _nameValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //Contact
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _email,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration: InputDecoration(
                              errorText: _emailValidate
                                  ? 'Value Can\'t Be Empty'
                                  : null,
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Enter Your Contact no / Gmail',
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              border: new OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            sendOTP();
                          },
                          child: Text(
                            'Send OTP',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),

                  //Password

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _password,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password/OTP',
                        hintText: 'Enter Your Password/OTP',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        prefixText: '  ',
                        errorText:
                            _passwordValidate ? 'Value Can\'t Be Empty' : null,
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

                  //Address
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _address,
                      onChanged: (val) {
                        setState(() => address = val);
                      },
                      decoration: InputDecoration(
                        errorText:
                            _addressValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your Address',
                        prefixIcon: Icon(
                          Icons.my_location,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: new OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //City
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _city,
                      onChanged: (val) {
                        setState(() => city = val);
                      },
                      decoration: InputDecoration(
                        errorText:
                            _cityValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your City',
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: new OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //State
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _state,
                      onChanged: (val) {
                        setState(() => state = val);
                      },
                      decoration: InputDecoration(
                        errorText:
                            _stateValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your State',
                        prefixIcon: Icon(
                          Icons.location_on_sharp,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: new OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //Id
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _id,
                      onChanged: (val) {
                        setState(() => id = val);
                      },
                      decoration: InputDecoration(
                        errorText: _idValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your Id',
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: new OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      controller: _otp,
                      // onChanged: (val) {
                      //   setState(() => address = val);
                      // },
                      decoration: InputDecoration(
                        errorText:
                            _otpValidate ? 'Value Can\'t Be Empty' : null,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Your OTP',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        border: new OutlineInputBorder(),
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
                                builder: (context) => p2_option(),
                              ));
                        },
                        child: Text('Log In'),
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
                          var _otpVerified = verifyOTP();
                          setState(() {
                            _name.text.isEmpty
                                ? _nameValidate = true
                                : _nameValidate = false;
                            _email.text.isEmpty
                                ? _emailValidate = true
                                : _emailValidate = false;
                            _password.text.isEmpty
                                ? _passwordValidate = true
                                : _passwordValidate = false;
                            _address.text.isEmpty
                                ? _addressValidate = true
                                : _addressValidate = false;
                            _city.text.isEmpty
                                ? _cityValidate = true
                                : _cityValidate = false;
                            _state.text.isEmpty
                                ? _stateValidate = true
                                : _stateValidate = false;
                            _id.text.isEmpty
                                ? _idValidate = true
                                : _idValidate = false;
                            _otp.text.isEmpty
                                ? _otpValidate = true
                                : _otpValidate = false;
                          });
                          dynamic result =
                              await _auth.registerwithEmailAndPassword(email,
                                  password, name, state, city, address, id);
                          if (result == null ||
                              !(_nameValidate == false &&
                                  _emailValidate == false &&
                                  _passwordValidate == false &&
                                  _addressValidate == false &&
                                  _cityValidate == false &&
                                  _stateValidate == false &&
                                  _idValidate == false) ||
                              _otpVerified == false) {
                            setState(() {
                              final snackBar = SnackBar(
                                content: Text('OTP Not Verified. or User Exists'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                            setState(() {
                              error = 'Something went wrong. Try again';
                            });
                          } else {
                            setState(() {
                              final snackBar = SnackBar(
                                content: Text('OTP Verified Successfully.'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                            // _firebaseAuth
                            //     .signInWithEmailAndPassword(
                            //         email: _email, password: _password)
                            //     .then((_) {
                            //   Navigator.of(context).pushReplacement(
                            //       MaterialPageRoute(
                            //           builder: (context) => p3_employer_login()));
                            // });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => p3_employer_login(),
                                ));
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        color: Colors.white,
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
    );
  }
}
