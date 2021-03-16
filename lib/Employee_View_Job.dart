import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/p5_Employee_Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmployeeJob extends StatefulWidget {
  @override
  _employee_jobState createState() => _employee_jobState();
}

class _employee_jobState extends State<EmployeeJob> {

//class EmployeeJob extends StatelessWidget{
  String name1,address,state,city,email,user_uid,display='';
  final _authf = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  User user;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employee");
  @override
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
        name1 = value.data()['name'].toString();
        address = value.data()['address'].toString();
        city = value.data()['city'].toString();
        state = value.data()['state'].toString();
        user_uid = FirebaseAuth.instance.currentUser.uid;
        email = value.data()['email'].toString();
      });
    });
  }
  initUser() async{
    user = await _authf.currentUser;
    setState(() {});
  }
  @override
  Widget build(BuildContext context){

    final Employer employer = ModalRoute.of(context).settings.arguments;
    String uid = employer.user_uid;
    return Scaffold(
      key: _scaffoldkey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: (){
                //setState(() {
                  if(this.cusIcon.icon == Icons.search){
                    this.cusIcon = Icon(Icons.cancel);
                    this.cutSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Search",
                        border: new OutlineInputBorder(
                        ),
                      ),
                      style : TextStyle(
                        color:Colors.blue,
                        fontSize: 16.0,
                      ),
                    );
                  }
                  else{
                    this.cusIcon = Icon(Icons.search);
                    this.cutSearchBar = Text("Employee");
                  }
               // });
              },
              icon: cusIcon,
            ),


            IconButton(
              icon: Icon(Icons.notifications),
              onPressed:(){},
            ),

            IconButton(
              icon: Icon(Icons.chat),
              onPressed:(){},
            ),

          ],

          title:  cutSearchBar,

        ),
        drawer: p5_employee_drawer(),
        body: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //ListTileTheme(
                  //textColor: Colors.white,

                  ListTile(
                    title: Text(
                      employer.jobtitle,
                      //'g',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '',
                          //'h',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                       Text(
                         'Vacancy: ${employer.vacancy}',
                         //'h',
                          style: TextStyle(
                          color: Colors.black,
                            fontSize: 15,
                      ),
                    ),
                        Text(
                          'Skills: ${employer.skills}',
                          //'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Job Type: ${employer.jobtype}',
                          //'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Job Mode: ${employer.jobmode}',
                          //'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'State: ${employer.state}',
                         // 'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'City: ${employer.city}',
                         // 'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Salary: ${employer.salary}',
                          //'h',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                    ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Apply'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue
                          ),
                          onPressed:  ()
                          {
                            dynamic result = FirebaseFirestore.instance.collection("Employer").doc(uid).collection("JOB_Apply").add({
                              "name" : name1,
                            "user_uid" : user_uid,
                            "city" : city,
                            "state" : state,
                            "email" : email,
                            "address" : address,
                           }).then((value){

                          });
                            final snackbar = SnackBar(
                                content: Text('Applied Successfully')
                            );
                            _scaffoldkey.currentState.showSnackBar(snackbar);
                          },
                        ),
                        const SizedBox(width: 10),
                      ]
                  )
                ]
            )
        )
    ));

  }
}