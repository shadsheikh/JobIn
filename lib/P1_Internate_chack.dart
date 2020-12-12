import 'dart:io';

import 'package:dsc_jobin/P2_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void iniState(){
    super.initState();
    try{
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          //internet conn available
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
             p2_option(),
          ));
        }else{
          // no conn
          _showdialog();
        }
      }).catchError((error){
        // no conn
        _showdialog();
      });
    } on SocketException catch(_){
      //no internet
      _showdialog();
    }
  }

  void _showdialog(){
    showDialog(
      context: context,
      builder:(context) => AlertDialog(
          title: Text('ERROR'),
          content: Text("No Internet Detected."),
          actions: <Widget>[
            FlatButton(
              onPressed: () =>SystemChannels.platform.invokeMethod('Systemnavigator.pop'),
              child: Text("Exit"),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
                padding:EdgeInsets.only(
                    top:20.0
                ),
                child:Text(
                    "Checking Your Internet Connection"
                )
            ),
          ],
        ),
      ),
    );
  }
}

