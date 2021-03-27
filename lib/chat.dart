import 'package:dsc_jobin/chatUser.dart';
import 'package:dsc_jobin/p2_options.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _blue = Colors.blue;
  var _white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _white,
      appBar: AppBar(
          title: Text(
        "Chat",
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            column("John Marsh"),
            column("John Marsh"),
            column("John Marsh"),
            column("John Marsh"),
          ],
        ),
      ),
    );
  }

  Column column(String name) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.person,
            color: _blue,
          ),
          title: Text(
            '$name',
            style: TextStyle(color: _blue, fontWeight: FontWeight.bold),
          ),
          tileColor: _white,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatUser(),
                ));
          },
        ),
        Divider(
          color: _blue,
        ),
      ],
    );
  }
}
