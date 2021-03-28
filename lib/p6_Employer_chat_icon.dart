import 'package:dsc_jobin/chat.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            badgeColor: Colors.white,
            badgeContent: Text(
              _counter.toString(),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            child: IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ));
              },
              tooltip: 'Chat',
            ),
          );
  }
}