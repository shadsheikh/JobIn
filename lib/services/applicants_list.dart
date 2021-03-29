import 'package:dsc_jobin/models/applicants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/services/employer_tile.dart';
import 'package:dsc_jobin/services/applicants_tile.dart';
class ApplicantsList extends StatefulWidget{
  @override
  _ApplicantsListState createState() => _ApplicantsListState();
}

class _ApplicantsListState extends State<ApplicantsList>{
  @override
  Widget build(BuildContext context) {
    final applicant = Provider.of<List<Applicants>>(context);
    return applicant==null
        ? Container()
        :ListView.builder(
        itemCount: applicant.length,
        itemBuilder: (context,index){
          return ApplicantsTile(applicants: applicant[index]);
        }
    );
  }
}