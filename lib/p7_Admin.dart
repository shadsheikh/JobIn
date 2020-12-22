import 'package:flutter/material.dart';

class p7_admin extends StatefulWidget {
  @override
  _p7_adminState createState() => _p7_adminState();
}

class _p7_adminState extends State<p7_admin> {

  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Admin");

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
                  this.cutSearchBar = Text("Admin");
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


      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Shad Sheikh",
              ),
              accountEmail: Text(
                  "shadsheikh3107@gmail.com"
              ),
              currentAccountPicture: CircleAvatar(
                child : Text(
                    "S"
                ),
                backgroundColor: Colors.white,
              ),
            ),

            ListTile(
              leading : Icon(Icons.person_add_outlined),
              title : Text(
                "Change Name",
              ),
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.settings_applications),
              title : Text(
                "Job Appled",
              ),
            ),

            Divider(),

            ListTile(
              leading : Icon(Icons.person_add),
              title : Text(
                "Complete Your Profile",
              ),
            ),


            Divider(),

            ListTile(
              leading : Icon(Icons.autorenew),
              title : Text(
                "Change Password",
              ),
            ),

          ],
        ),
      ),

    );
  }

}