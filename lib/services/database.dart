import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  final _authf = FirebaseAuth.instance;
  User user;
  String _city,_jobtitle,_jobtype,_jobmode,_skills,_state,_vacancy,_salary;
  DatabaseService({this.uid});


  final CollectionReference employerCollection = FirebaseFirestore.instance.collection('JOB');


  //employer list from snapshot
  List<Employer> _employerListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Employer(
          city: doc.data()['City'].toString() ,
          jobtitle: doc.data()['Jobtitle'].toString() ,
          salary: doc.data()['Salary'].toString() ,
           jobmode: doc.data()['Job_Mode'].toString() ,
      jobtype: doc.data()['Job_Type'].toString() ,
      vacancy: doc.data()['Vacancy'].toString() ,
         skills: doc.data()['Skills'].toString() ,
         state: doc.data()['State'].toString() ,
        user_uid: doc.data()['user_uid'].toString(),
      );
    }).toList();
  }

  Stream<List<Employer>> get employer {
    return employerCollection.snapshots()
   .map(_employerListFromSnapshot);
  }

}
