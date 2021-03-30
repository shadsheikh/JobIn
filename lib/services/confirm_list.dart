import 'package:dsc_jobin/models/applicants.dart';
import 'package:dsc_jobin/models/confirm_employee.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:dsc_jobin/models/employer.dart';
import 'package:dsc_jobin/services/employer_tile.dart';
import 'package:dsc_jobin/services/applicants_tile.dart';

import 'confirm_tile.dart';
class ConfirmList extends StatefulWidget{
  @override
  _ConfirmListState createState() => _ConfirmListState();
}

class _ConfirmListState extends State<ConfirmList>{
  @override
  Widget build(BuildContext context) {
    final confirm= Provider.of<List<Confirm>>(context);
    return confirm==null
        ? Container()
        :ListView.builder(
        itemCount: confirm.length,
        itemBuilder: (context,index){
          return ConfirmTile(confirm: confirm[index]);
        }
    );
  }
}