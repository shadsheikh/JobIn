import 'package:dsc_jobin/p6_9_1_Employer_sendMail.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Drop a Mail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'For any suggestion and query, kindly drop a mail.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SendMail(),
                                ));
                          },
                          child: Text(
                            'Mail Us',
                            style: TextStyle(color: _white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bypass Rd Behind, Square, Malwa County, Manglaya Sadak, Indore, Madhya Pradesh 453771',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: RaisedButton(
                          onPressed: _map,
                          child: Text(
                            'View in Google Maps',
                            style: TextStyle(color: _white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        heroTag: "facebook",
                        backgroundColor: _white,
                        tooltip: 'Facebook',
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: _blue,
                        ),
                        onPressed: _facebook,
                      ),
                      FloatingActionButton(
                        backgroundColor: _white,
                        heroTag: 'instagram',
                        tooltip: 'Instagram',
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: _blue,
                        ),
                        onPressed: _instagram,
                      ),
                      FloatingActionButton(
                        backgroundColor: _white,
                        tooltip: 'Twitter',
                        heroTag: 'twitter',
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          color: _blue,
                        ),
                        onPressed: _twitter,
                      ),
                      FloatingActionButton(
                        backgroundColor: _white,
                        heroTag: 'linkedin',
                        child: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: _blue,
                        ),
                        onPressed: _linkedin,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_facebook() async {
  const url = 'https://www.facebook.com/pg/dscacropolis/posts/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instagram() async {
  const url = 'https://www.instagram.com/dscacropolis/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_twitter() async {
  const url = 'https://twitter.com/dscacropolis?lang=en';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_linkedin() async {
  const url = 'https://www.linkedin.com/company/dsc-acropolis/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_map() async {
  const url =
      'https://www.google.com/maps/place/Acropolis+Institute+Of+Technology+And+Research+-+AITR/@22.8212926,75.9409654,17z/data=!3m1!4b1!4m5!3m4!1s0x39631cf455b4cec3:0x426141aa8141f7a5!8m2!3d22.8212926!4d75.9431541';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
