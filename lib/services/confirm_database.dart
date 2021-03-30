import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/confirm_employee.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConfirmService
{
  final String uid;
  User user;
  ConfirmService({this.uid});
  final CollectionReference ConfirmCollection = FirebaseFirestore.instance.collection('Employer').doc(FirebaseAuth.instance.currentUser.uid).collection("Confirm_Employee");
  List<Confirm>_confirmListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Confirm(
        name: doc.data()['name'].toString() ,
        email: doc.data()['email'].toString() ,
        address: doc.data()['address'].toString() ,
        city: doc.data()['city'].toString() ,
        state: doc.data()['state'].toString() ,
        user_uid: doc.data()['user_uid'].toString() ,
      );
    }).toList();
  }
  Stream<List<Confirm>> get confirm {
    return ConfirmCollection.snapshots()
        .map(_confirmListFromSnapshot);
  }
}
