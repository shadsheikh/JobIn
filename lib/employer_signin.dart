import 'package:dsc_jobin/p2_options.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';
import 'package:dsc_jobin/p3_Employee_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/services/auth.dart';

class sign12 extends StatefulWidget {
  @override
  _sign12State createState() => _sign12State();
}

class _sign12State extends State<sign12> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email,password,address,name,city,state,id;
  String error = '';
  var _password = TextEditingController();
  var _passwordVisible;
  var _passwordValidate=false;
  @override
  void initState() {
    _passwordVisible = false;
  }
  Widget build(BuildContext context) {
    return Scaffold(


      resizeToAvoidBottomInset: false,
     appBar: AppBar(
          title: Text(
            "Sign Up",
          )
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [

                //Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() => name = val);
                    },
                    decoration: InputDecoration(

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
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

                //Password

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _password,
                    obscureText: !_passwordVisible,

                    onChanged: (val){
                      setState(() => password = val);
                    },
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
                    onChanged: (val){
                      setState(() => address = val);
                    },
                    decoration: InputDecoration(
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
                    onChanged: (val){
                      setState(() => city = val);
                    },
                    decoration: InputDecoration(
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
                    onChanged: (val){
                      setState(() => state = val);
                    },
                    decoration: InputDecoration(
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
                    onChanged: (val){
                      setState(() => id = val);
                    },
                    decoration: InputDecoration(
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
                        dynamic result = await _auth
                            .registerwithEmailAndPassword(email, password, name,state,city,address,id);
                        if (result == null) {
                          setState(() {
                            error = 'Something went wrong. Try again';
                          });
                        }
                        else {
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
    );
  }
}
