import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/services/employer_tile.dart';

class EmployerList extends StatefulWidget{
  @override
  _EmployerListState createState() => _EmployerListState();
}

class _EmployerListState extends State<EmployerList>{
  @override
  Widget build(BuildContext context) {
    final employer = Provider.of<List<Employer>>(context);

    return ListView.builder(
      itemCount: employer.length,
      itemBuilder: (context,index){
        return EmployerTile(employer: employer[index]);
      }
    );
  }
}
