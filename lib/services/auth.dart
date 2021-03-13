//import 'lib.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc_jobin/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class AuthService{

  final FirebaseAuth _auth =  FirebaseAuth.instance;
  String name,state,city,id,address;
  //create user obj based  on firebaseuser
  Users _userFromFirebaseUser(User user){
    return user!=null ? Users(uid: user.uid) : null;
  }

  //sign up with email and password

  Future registerwithEmailAndPassword(String email , String password, String name,String state, String city, String address, String id) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await FirebaseFirestore.instance.collection('Employer')
          .doc(user.uid)
          .set({
        "uid" : user.uid,
        "name" : name,
        "address" : address,
        "city" : city,
        "state" : state,
        "email" : email,
        "password" : password,
        "id" : id,
      });
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //login with email and password
  Future signInwithEmailAndPassword(String email , String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}