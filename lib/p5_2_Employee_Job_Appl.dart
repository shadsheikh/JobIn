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

    );
  }

}
