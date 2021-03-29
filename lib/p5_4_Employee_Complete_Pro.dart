
import 'package:dsc_jobin/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class p5_4_employee_complete_pro extends StatefulWidget {
  @override
  _p5_4_employee_complete_proState createState() => _p5_4_employee_complete_proState();
}

class _p5_4_employee_complete_proState extends State<p5_4_employee_complete_pro> {
  final AuthService _auth = AuthService();
  final _authf = FirebaseAuth.instance;
  String name,email,skills,dob;
  User user;
  DateTime selectedDate =DateTime.parse("1990-01-01");
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

    FirebaseFirestore.instance.collection('Employee')
        .doc((await FirebaseAuth.instance.currentUser).uid)
        .get()
        .then((value){
      setState(() {
        name = value.data()['name'].toString();
        email = value.data()['email'].toString();
        skills = value.data()['skills'].toString();
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
    skillsController.text = "$skills";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          //AppNotification(),
          //Chat(),
        ],
        title: Text('Complete Your Profile'),
      ),
      drawer: p5_employee_drawer(),
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
                           hintText: "Name")
                        //errorText: _displayNameValid ? null : "Display Name too short",
                      ),

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
                      //controller: skillsController,
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
                          "Email Address",
                          style: TextStyle(color: Colors.grey),
                        )),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email Address",
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
                      Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                      ),
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          _selectDate(context);
                         // select = selectedDate;
                        },
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
                //select = selectedDate.toLocal().split(' ')[0];
                FirebaseFirestore.instance.collection('Employee')
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
