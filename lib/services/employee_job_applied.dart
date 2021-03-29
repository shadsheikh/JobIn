import 'package:dsc_jobin/p6_9_Employer_Con_Us.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/services/employer_tile.dart';
import 'package:dsc_jobin/models/employee.dart';
import 'package:dsc_jobin/services/employee_jobtile.dart';


class EmployeeJobList extends StatefulWidget{
  @override
  _EmployeeJobState createState() => _EmployeeJobState();
}

class _EmployeeJobState extends State<EmployeeJobList>{
  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<List<Employee>>(context);
    return employee==null
      ? Container()
      :ListView.builder(
        itemCount: employee.length,
        itemBuilder: (context,index){
          return EmployeeTile(employee: employee[index]);
        }
    );
  }
}