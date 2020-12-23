import 'package:dsc_jobin/p6_Employer_chat.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification.dart';
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
  _p6_2_emplooyer_current_jobsState createState() =>
      _p6_2_emplooyer_current_jobsState();
}

class _p6_2_emplooyer_current_jobsState
    extends State<p6_2_emplooyer_current_jobs> {
  Color _white = Colors.white;
  Color _blue = Colors.blue;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Current Jobs");
  // var _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cutSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Search",
                      border: new OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cutSearchBar = Text("Employer");
                }
              });
            },
            icon: cusIcon,
          ),
          AppNotification(),
          Chat(),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
