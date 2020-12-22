import 'package:flutter/material.dart';
import 'p5_Employee_Drawer.dart';

class p5_5_employee_skill extends StatefulWidget {
  @override
  _p5_5_employee_skillState createState() => _p5_5_employee_skillState();
}

class _p5_5_employee_skillState extends State<p5_5_employee_skill> {

  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Skill");

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
                  this.cutSearchBar = Text("Skill");
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

    );
  }

}
