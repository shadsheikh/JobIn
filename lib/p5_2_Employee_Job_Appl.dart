import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';

class p5_2_employee_job_appl extends StatefulWidget {
  @override
  _p5_2_employee_job_applState createState() => _p5_2_employee_job_applState();
}

class _p5_2_employee_job_applState extends State<p5_2_employee_job_appl> {

  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Job Applied");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
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
                  this.cutSearchBar = Text("Job Applied");
                }
              });
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: container(
                  context,
                  'John Marsh',
                  '20',
                  'Teaching',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
          ],
        ),
      ),

    );
  }

}


Container container(
    BuildContext context,
    String name,
    String age,
    String skills,
    String address,
    String contact) {
  var _blue = Colors.blue;
  var _white = Colors.white;
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Tooltip(
      message: 'Click to View Profile',
      child: RaisedButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        onPressed: () {},
        color: _blue,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Organization Name : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$name',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Date of Appolication : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$age',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Skills Required : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$skills',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Address : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$address',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: new TextSpan(
                    style: TextStyle(fontSize: 20.0, color: _white),
                    children: [
                      new TextSpan(
                          text: 'Contact No. : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$contact',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

