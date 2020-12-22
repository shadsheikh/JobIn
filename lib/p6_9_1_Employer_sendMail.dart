import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:flutter/material.dart';

class SendMail extends StatefulWidget {
  @override
  _SendMailState createState() => _SendMailState();
}

class _SendMailState extends State<SendMail> {
  var _name = TextEditingController();
  var _email = TextEditingController();
  var _subject = TextEditingController();
  var _message = TextEditingController();
  var _white=Colors.white;
  var _blue=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Contact Us"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
        ],
      ),
      drawer: EmployerDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'E-mail',
                    hintText: 'Enter Your E-mail Address',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _subject,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Subject',
                    hintText: 'Enter Your Subject',
                    prefixIcon: Icon(
                      Icons.subject,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _message,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Message',
                    hintText: 'Enter Your Message',
                    prefixIcon: Icon(
                      Icons.message,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    border: new OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: RaisedButton.icon(
                    onPressed: () {
                      
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.send,
                      color: _white,
                    ),
                    textColor: _white,
                    color:_blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
