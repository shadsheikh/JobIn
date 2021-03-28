import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DataService
{
  final String uid;
  User user;
  DataService({this.uid});
  final CollectionReference JobCollection = FirebaseFirestore.instance.collection('Employer').doc(FirebaseAuth.instance.currentUser.uid).collection("JOB_Apply");
  List<Applicants>_applicantsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Applicants(
        address: doc.data()['address'].toString() ,
        city: doc.data()['city'].toString() ,
        email: doc.data()['email'].toString() ,
        name: doc.data()['name'].toString() ,
        state: doc.data()['state'].toString() ,
        user_uid: doc.data()['user_uid'].toString() ,
      );
    }).toList();
  }
  Stream<List<Applicants>> get applicants {
    return JobCollection.snapshots()
        .map(_applicantsListFromSnapshot);
  }
}
