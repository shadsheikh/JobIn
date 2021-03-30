import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'p6_Employer_chat_icon.dart';
import 'p6_Employer_drawer.dart';
import 'p6_Employer_notification_icon.dart';
import 'package:dsc_jobin/services/auth.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final AuthService _auth = AuthService();
  final _authf = FirebaseAuth.instance;
  String name,email,skills,dob;
  User user;
  DateTime selectedDate= DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1910, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void initState() {
    super.initState();
    _getData();
    initUser();
  }
  Future<void> _getData() async{

    FirebaseFirestore.instance.collection('Employer')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value){
      setState(() {
        name = value.data()['name'].toString();
        email = value.data()['email'].toString();
        //skills = value.data()['skills'].toString();
        dob = value.data()['dob'].toString();
      });
    });
  }
  initUser() async{
    user = await _authf.currentUser;
    setState(() {});
  }


  @override
  TextEditingController displayNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController skillsController = new TextEditingController();
  DateTime select;
  Widget build(BuildContext context) {
    displayNameController.text = "$name";
    emailController.text = "$email";
    //skillsController.text = "$skills";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          AppNotification(),
          Chat(),
        ],
        title: Text('Complete Your Profile'),
      ),
      drawer: EmployerDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          "Display Name",
                          style: TextStyle(color: Colors.grey),
                        )),
                    TextField(
                      controller: displayNameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        //errorText: _displayNameValid ? null : "Display Name too short",
                      ),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          "Add Skills ",
                          style: TextStyle(color: Colors.grey),
                        )),
                    TextField(
                      controller: skillsController,
                      decoration: InputDecoration(
                        hintText: "Add Skills",
                        //errorText: _displayNameValid ? null : "Display Name too short",
                      ),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          "Add Email Address",
                          style: TextStyle(color: Colors.grey),
                        )),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Add Email Address",
                        //errorText: _displayNameValid ? null : "Display Name too short",
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Text('Add DOB',style: TextStyle(color: Colors.grey),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () => _selectDate(context),
                        child: Text('Select date'),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black,),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.white,
              onPressed: () {
                FirebaseFirestore.instance.collection('Employer')
                    .doc((FirebaseAuth.instance.currentUser).uid)
                    .update({
                  "name":displayNameController.text,
                  "skills":skillsController.text,
                  "dob":"${selectedDate.toLocal()}".split(' ')[0],
                });
              },
              child: Text(
                "Update Profile",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
