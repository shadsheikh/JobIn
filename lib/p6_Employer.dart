import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:flutter/material.dart';

class p6_employer extends StatefulWidget {
  @override
  _p6_employerState createState() => _p6_employerState();
}

class _p6_employerState extends State<p6_employer> {
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Employer");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cutSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Search",
                      border: new OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cutSearchBar = Text("Employer");
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
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
                  'B.Tech',
                  'Male',
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
                  'B.Tech',
                  'Male',
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
                  'B.Tech',
                  'Male',
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
                  'B.Tech',
                  'Male',
                  '164, Saket Nagar, Indore, MP',
                  '9876543210'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _white = Colors.white;
    return Container(
      alignment: Alignment.centerLeft,
      color: _white,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Search',
          prefixText: '  ',
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
    String qualification,
    String gender,
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
                          text: 'Name: ',
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
                          text: 'Age: ',
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
                          text: 'Skills: ',
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
                          text: 'Qualification : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$qualification',
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
                          text: 'Gender: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$gender',
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
                          text: 'Address: ',
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

//Vishesh's Code
/*

  Color _white = Colors.white;
  Color _blue = Colors.blue;
  // var _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: _blue,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Logo.png'),
                      radius: 70,
                    ),
                  ),
                  Text('Company Name',
                      style: TextStyle(color: _white, fontSize: 20))
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Applicants(0)',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {
//                  Navigator.push(
//                      context,
 //                     MaterialPageRoute(
 //                       builder: (context) => Applicants(),
  //                    ));
                }),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Employees(0)',
                  style: TextStyle(color: _blue),
                ),

     //           onTap: () {
     //             Navigator.push(
     //                 context,
     //                 MaterialPageRoute(
     //                   builder: (context) => Employee(),
     //                 ));
                //}
                ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Complete Your Profile',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Current Jobs(0)',
                  style: TextStyle(color: _blue),
                ),
       //         onTap: () {
       //           Navigator.push(
       //               context,
       //               MaterialPageRoute(
       //                 builder: (context) => CurrentJob(),
       //              ));
               // }
                ),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Create New Job',
                style: TextStyle(color: _blue),
              ),
       //       onTap: () {
       //         Navigator.push(
       //             context,
       //             MaterialPageRoute(
       //               builder: (context) => NewJob(),
       //             ));
       //       },
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Skills',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Change Password',
                style: TextStyle(color: _blue),
              ),

         //     onTap: () {
          //      Navigator.push(
         //           context,
         //           MaterialPageRoute(
        //              builder: (context) => ChangePassword(),
        //            ));
        //      },
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Report User',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
          ],
        ),
      ),


      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            title: TextBox(),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.comment),
                tooltip: 'Chat',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.filter),
                tooltip: 'Filter',
                onPressed: () {},
              ),
            ],
            backgroundColor: _blue,
            elevation: 50.0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ),
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Trending Applicants',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(
                      context,
                      'John Marsh',
                      '25',
                      'Teaching',
                      'M.Tech',
                      'Male',
                      '128, Saket Nager, Indore, M.P.',
                      '9876543210'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _white = Colors.white;
    return Container(
      alignment: Alignment.centerLeft,
      color: _white,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Search',
          prefixText: '  ',
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
    String qualification,
    String gender,
    String address,
    String contact) {
  var _blue = Colors.blue;
  var _white = Colors.white;
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Tooltip(
      message: 'View Profile',
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
                          text: 'Name: ',
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
                          text: 'Age: ',
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
                          text: 'Skills: ',
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
                          text: 'Qualification : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$qualification',
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
                          text: 'Gender: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: '$gender',
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
                          text: 'Address: ',
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

 */
