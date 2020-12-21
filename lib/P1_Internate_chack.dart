import 'dart:io';

import 'package:dsc_jobin/P2_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class p1_internet_check extends StatefulWidget {
  @override
  _p1_internet_checkState createState() => _p1_internet_checkState();
}

class _p1_internet_checkState extends State<p1_internet_check> {

  ConnectivityResult previous;


  @override
  void initState(){
    super.initState();
    try{
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
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

    Connectivity().onConnectivityChanged.listen((ConnectivityResult connresult){
      if(connresult == ConnectivityResult.none){

      }else if(previous == ConnectivityResult.none){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (Context) =>
            p2_option(),
        ));
      }
      previous = connresult;
    });



  }

  void _showdialog(){
    showDialog(
      context: context,
      builder:(context) => AlertDialog(
          title: Text('ERROR'),
          content: Text("No Internet Detected."),
          actions: <Widget>[
            FlatButton(
              onPressed: () => SystemChannels.platform.invokeMethod('Systemnavigator.pop'),
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

