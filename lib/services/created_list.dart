import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/jobs_created.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/services/employer_tile.dart';
import 'package:dsc_jobin/services/applicants_tile.dart';

import 'created_tile.dart';
class JobList extends StatefulWidget{
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList>{
  @override
  Widget build(BuildContext context) {
    final created = Provider.of<List<Created>>(context);

    return ListView.builder(
        itemCount: created.length,
        itemBuilder: (context,index){
          return JobTile(created: created[index]);
        }
    );
  }
}