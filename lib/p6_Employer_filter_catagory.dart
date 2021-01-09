import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class FilterCatagory extends StatefulWidget {
  @override
  _FilterCatagoryState createState() => _FilterCatagoryState();
}

class _FilterCatagoryState extends State<FilterCatagory> {
 bool _isChecked = true;

  List<String> _texts = [
    "InduceSmile.com," "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text('Choose Catagory'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _texts.map((text) => CheckboxListTile(
          title: Text(text),
           value: _isChecked,
              onChanged: (val) {
              setState(() {
               _isChecked = val;

            });
          },
        )).toList(),
      ),
    );
  }
}