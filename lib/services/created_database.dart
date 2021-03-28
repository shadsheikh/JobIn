import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/models/jobs_created.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CreatedService
{
  final String uid;
  User user;
  CreatedService({this.uid});
  final CollectionReference JobCreated = FirebaseFirestore.instance.collection('Employer').doc(FirebaseAuth.instance.currentUser.uid).collection("Created_Jobs");
  List<Created>_jobListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Created(
        jobtitle: doc.data()['Jobtitle'].toString() ,
        salary: doc.data()['Salary'].toString() ,
        vacancy: doc.data()['Vacancy'].toString() ,
        skills: doc.data()['Skills'].toString() ,
        jobmode: doc.data()['Job_Mode'].toString() ,
        jobtype: doc.data()['Job_Type'].toString() ,
        city: doc.data()['City'].toString() ,
        state: doc.data()['State'].toString() ,
      );
    }).toList();
  }
  Stream<List<Created>> get created {
    return JobCreated.snapshots()
        .map(_jobListFromSnapshot);
  }
}
