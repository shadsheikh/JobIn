
import 'package:dsc_jobin/p5_Employee.dart';
import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';
class p5_4_employee_complete_pro extends StatefulWidget {
  @override
  _p5_4_employee_complete_proState createState() => _p5_4_employee_complete_proState();
}

class _p5_4_employee_complete_proState extends State<p5_4_employee_complete_pro> {
  var _name=TextEditingController();
  var _skills=TextEditingController();
  var _email=TextEditingController();
  var _dob=TextEditingController();
  var _nameValidate = false;
  var _skillsValidate = false;
  var _emailValidate = false;
  var _dobValidate = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    _name.dispose();
    _skills.dispose();
    _email.dispose();
    _dob.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Complete Your Profile"
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed:(){},
          ),

          IconButton(
            icon: Icon(Icons.chat),
            onPressed:(){},
          ),

        ],
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
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: "Update Display Name",
                        errorText:
                        _nameValidate ? 'Value Can\'t Be Empty' : null,
                        //errorText: _displayNameValid ? null : "Display Name too short",
                      ),
                    )
                  ],
                )
              ),

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
                        controller: _skills,
                        decoration: InputDecoration(
                          hintText: "Add Skills",
                          errorText:
                          _skillsValidate ? 'Value Can\'t Be Empty' : null,
                          //errorText: _displayNameValid ? null : "Display Name too short",
                        ),
                      )
                    ],
                  )
              ),

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
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "Add Email Address",
                          errorText:
                          _emailValidate ? 'Value Can\'t Be Empty' : null,
                          //errorText: _displayNameValid ? null : "Display Name too short",
                        ),
                      )
                    ],
                  )
              ),

              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Text(
                            "Add DOB",
                            style: TextStyle(color: Colors.grey),
                          )),
                      TextField(
                        controller: _dob,
                        decoration: InputDecoration(
                          hintText: "Add DOB",
                          errorText:
                          _dobValidate ? 'Value Can\'t Be Empty' : null,
                          //errorText: _displayNameValid ? null : "Display Name too short",
                        ),
                      )
                    ],
                  )
              ),

              RaisedButton(
                onPressed: (){
                  setState(() {
                    _name.text.isEmpty
                        ? _nameValidate = true
                        : _nameValidate = false;
                    _skills.text.isEmpty
                        ? _skillsValidate = true
                        : _skillsValidate = false;
                    _email.text.isEmpty
                        ? _emailValidate = true
                        : _emailValidate = false;
                    _dob.text.isEmpty
                        ? _dobValidate = true
                        : _dobValidate = false;
                  }



                  );
                  if( _nameValidate==false && _skillsValidate==false && _emailValidate==false &&
                          _dobValidate==false) {
                    // final snackbar = SnackBar(
                    //     content: Text('Applied Successfully')
                    //
                    // );
                    // _scaffoldkey.currentState.showSnackBar(snackbar);
                    final snackBar = SnackBar(
                      content: Text('Applied Successfully'),

                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => p5_employee(),
                        ));
                  }
                  else {
                    final snackBar = SnackBar(
                      content: Text('Complete Your Profile'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }
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

/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/widgets/progress.dart';

class EditProfile extends StatefulWidget {
  final String currentUserId;

  EditProfile({this.currentUserId});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isLoading = false;
  User user;
  bool _displayNameValid = true;
  bool _bioValid = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await usersRef.document(widget.currentUserId).get();
    user = User.fromDocument(doc);
    displayNameController.text = user.displayName;
    bioController.text = user.bio;
    setState(() {
      isLoading = false;
    });
  }

  Column buildDisplayNameField() {
    return Column(
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
            hintText: "Update Display Name",
            errorText: _displayNameValid ? null : "Display Name too short",
          ),
        )
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            "Bio",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextField(
          controller: bioController,
          decoration: InputDecoration(
            hintText: "Update Bio",
            errorText: _bioValid ? null : "Bio too long",
          ),
        )
      ],
    );
  }

  updateProfileData() {
    setState(() {
      displayNameController.text.trim().length < 3 ||
          displayNameController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;
      bioController.text.trim().length > 100
          ? _bioValid = false
          : _bioValid = true;
    });

    if (_displayNameValid && _bioValid) {
      usersRef.document(widget.currentUserId).updateData({
        "displayName": displayNameController.text,
        "bio": bioController.text,
      });
      SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  logout() async {
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.done,
              size: 30.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: isLoading
          ? circularProgress()
          : ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    bottom: 8.0,
                  ),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                    CachedNetworkImageProvider(user.photoUrl),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildDisplayNameField(),
                      buildBioField(),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: updateProfileData,
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FlatButton.icon(
                    onPressed: logout,
                    icon: Icon(Icons.cancel, color: Colors.red),
                    label: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/