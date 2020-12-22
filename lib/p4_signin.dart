import 'package:dsc_jobin/p2_options.dart';
import 'package:dsc_jobin/p3_Employer_login.dart';
import 'package:flutter/material.dart';


class singin extends StatefulWidget {
  @override
  _singinState createState() => _singinState();
}

class _singinState extends State<singin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      border: new OutlineInputBorder(),
                    ),
                  ),
                ),

                //Address
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              //  builder: (context) => Employer(),
                            ));
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
