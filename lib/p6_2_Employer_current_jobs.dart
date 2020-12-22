import 'package:flutter/material.dart';
import 'p6_2_1_Employer_update_job.dart';

class p6_2_emplooyer_current_jobs extends StatefulWidget {
  static String jobTitle = "",
      salary = "",
      vacancy = "",
      skillsRequired = "",
      jobType = "",
      jobMode = "",
      state = "",
      city = "";

  @override
  _p6_2_emplooyer_current_jobsState createState() => _p6_2_emplooyer_current_jobsState();
}

class _p6_2_emplooyer_current_jobsState extends State<p6_2_emplooyer_current_jobs> {

  Color _white = Colors.white;
  Color _blue = Colors.blue;
  // var _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: _blue,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Logo.png'),
                      radius: 70,
                    ),
                  ),
                  Text('Company Name',
                      style: TextStyle(color: _white, fontSize: 20))
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Applicants(0)',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {/*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Applicants(),
                      ));
                */}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Show Employees(0)',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {/*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Employee(),
                      ));
                */}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Complete Your Profile',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Current Jobs(0)',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p6_2_emplooyer_current_jobs(),
                      ));
                }),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Create New Job',
                style: TextStyle(color: _blue),
              ),
              onTap: () {/*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewJob(),
                    ));
              */},
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Skills',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Change Password',
                style: TextStyle(color: _blue),
              ),
              onTap: () {/*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ));
             */ },
            ),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Report User',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
            Divider(color: Colors.black),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: _blue),
                ),
                onTap: () {}),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            title: TextBox(),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.comment),
                tooltip: 'Chat',
                onPressed: () {},
              ),
            ],
            backgroundColor: _blue,
            elevation: 50.0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ),
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Current Jobs',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: container(context, 'Teacher', '20000', '20', 'B.Ed',
                      'Full Time', 'Offline', 'Madhya Pradesh', 'Indore'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _white = Colors.white;
    return Container(
      alignment: Alignment.centerLeft,
      color: _white,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '  Search',
          prefixText: '  ',
        ),
      ),
    );
  }
}

Container container(
    BuildContext context,
    String jobTitle,
    String salary,
    String vacancy,
    String skillsRequired,
    String jobType,
    String jobMode,
    String state,
    String city) {
  p6_2_emplooyer_current_jobs.jobTitle = jobTitle;
  p6_2_emplooyer_current_jobs.salary = salary;
  p6_2_emplooyer_current_jobs.vacancy = vacancy;
  p6_2_emplooyer_current_jobs.skillsRequired = skillsRequired;
  p6_2_emplooyer_current_jobs.jobType = jobType;
  p6_2_emplooyer_current_jobs.state = state;
  p6_2_emplooyer_current_jobs.city = city;
  var _blue = Colors.blue;
  var _white = Colors.white;
  return Container(
    decoration:
    BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: _blue),
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => p6_2_1_employer_update_job(
                              jobTitle,
                              salary,
                              vacancy,
                              skillsRequired,
                              jobType,
                              jobMode,
                              state,
                              city)));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => UpdateJob(
                  //           CurrentJob.jobTitle,
                  //           CurrentJob.salary,
                  //           CurrentJob.vacancy,
                  //           CurrentJob.skillsRequired,
                  //           CurrentJob.jobType,
                  //           CurrentJob.jobMode,
                  //           CurrentJob.state,
                  //           CurrentJob.city),
                  //     ));
                },
                tooltip: 'Update Job',
                icon: Icon(Icons.refresh),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                tooltip: 'Delete Job',
                icon: Icon(Icons.delete),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'Job Title: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$jobTitle',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'Salary in (₹): ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$salary',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'No. of vacancies: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$vacancy',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'Skills Required : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$skillsRequired',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'Job Type: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$jobType',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'Job Mode : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$jobMode',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'State : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$state',
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20.0, color: _white),
                children: [
                  new TextSpan(
                      text: 'City : ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '$city',
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
