import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc_jobin/models/employee.dart';
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
  final CollectionReference employeeJob = FirebaseFirestore.instance
      .collection("Employee")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("JOB_Applied");

  //employee Job applied list from snapshot
  List<Employee> _employeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Employee(
        city: doc.data()['city'].toString() ,
        jobtitle: doc.data()['jobtittle'].toString() ,
        salary: doc.data()['salary'].toString() ,
        jobmode: doc.data()['jobmode'].toString() ,
        jobtype: doc.data()['jobtype'].toString() ,
        vacancy: doc.data()['vaccancy'].toString() ,
        skills: doc.data()['skills'].toString() ,
        state: doc.data()['state'].toString() ,
        uid: doc.data()['uid'].toString(),
      );
    }).toList();
  }

  Stream<List<Employee>> get employee{
    return employeeJob.snapshots()
        .map(_employeeListFromSnapshot);
  }

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
