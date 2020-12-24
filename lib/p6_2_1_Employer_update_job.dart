import 'package:dsc_jobin/p6_Employer_chat_icon.dart';
import 'package:dsc_jobin/p6_Employer_drawer.dart';
import 'package:dsc_jobin/p6_Employer_notification_icon.dart';
import 'package:flutter/material.dart';

class p6_2_1_employer_update_job extends StatefulWidget {
  static String jobTitle,
      salary,
      vacancy,
      skillsRequired,
      jobType,
      jobMode,
      state,
      city;
  p6_2_1_employer_update_job(
      jobTitle, salary, vacancy, skillsRequired, jobType, jobMode, state, city);
  static String title() {
    return jobTitle;
  }

  @override
  _p6_2_1_employer_update_jobState createState() =>
      _p6_2_1_employer_update_jobState();
}

enum JobType { fullTime, partTime }
enum JobMode { offline, online }

class _p6_2_1_employer_update_jobState
    extends State<p6_2_1_employer_update_job> {
  var _white = Colors.white;
  var _blue = Colors.blue;
  var _black = Colors.black;
  var _jobTitle =
      TextEditingController(text: p6_2_1_employer_update_job.title());
  var _salary = TextEditingController();
  var _vacancy = TextEditingController();
  var _jobTitileValidate = true;
  var _salaryValidate = false;
  var _vacancyValidate = false;
  String _selectedState;
  String _selectedCity;
  JobType _jobType = JobType.fullTime;
  JobMode _jobMode = JobMode.offline;
  Icon cusIcon = Icon(Icons.search);
  Widget cutSearchBar = Text("Update Job");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          AppNotification(),
          Chat(),
        ],
        title: cutSearchBar,
      ),
      drawer: EmployerDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _jobTitle,
                decoration: InputDecoration(
                  fillColor: _white,
                  filled: true,
                  labelText: 'Job Title',
                  hintText: 'Enter Job Title',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  errorText:
                      _jobTitileValidate ? 'Value Can\'t Be Empty' : null,
                  prefixText: '  ',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: _black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // initialValue: widget.salary,
                //controller: _salary,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //errorText: _salaryValidate ? 'Value Can\'t Be Empty' : null,
                  fillColor: _white,
                  filled: true,
                  labelText: 'Salary',
                  hintText: 'Enter Salary in(₹)',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, right: 8.0, bottom: 8.0, left: 12.0),
                    child: Icon(
                      Icons.monetization_on,
                      //size: 25,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  //prefixText: '  ',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: _black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // initialValue: widget.vacancy,
                //  controller: _vacancy,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //  errorText: _vacancyValidate ? 'Value Can\'t Be Empty' : null,
                  fillColor: _white,
                  filled: true,
                  labelText: 'Vacancy',
                  hintText: 'Enter No. of Vacancies',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  //prefixText: '  ',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: _black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: _white,
                child: SizedBox(
                  child: Text('Space for Skills'),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: _white,
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: _black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text('Full Time'),
                              groupValue: _jobType,
                              onChanged: (JobType value) {
                                setState(() {
                                  _jobType = value;
                                });
                              },
                              value: JobType.fullTime,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Part Time'),
                              groupValue: _jobType,
                              onChanged: (JobType value) {
                                setState(() {
                                  _jobType = value;
                                });
                              },
                              value: JobType.partTime,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.03,
                    child: Container(
                      color: _white,
                      child: Text(
                        'Job Type',
                        style: TextStyle(color: _black, fontSize: 12),
                      ),
                    )),
              ],
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: _white,
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: _black)),
                      //color: _white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text('Offline'),
                              groupValue: _jobMode,
                              onChanged: (JobMode value) {
                                setState(() {
                                  _jobMode = value;
                                });
                              },
                              value: JobMode.offline,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Online'),
                              groupValue: _jobMode,
                              onChanged: (JobMode value) {
                                setState(() {
                                  _jobMode = value;
                                });
                              },
                              value: JobMode.online,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.03,
                    child: Container(
                      color: _white,
                      child: Text(
                        'Job Mode',
                        style: TextStyle(color: _black, fontSize: 12),
                      ),
                    )),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    color: _white,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select State'),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_downward),
                      ),
                      underline: Container(
                        color: _black,
                        height: 1,
                      ),
                      value: _selectedState,
                      items: <String>[
                        'Andaman and Nicobar Islands',
                        'Andhra Pradesh',
                        'Arunachal Pradesh',
                        'Assam',
                        'Bihar',
                        'Chandigarh',
                        'Chhattisgarh',
                        'Dadra & Nagar Haveli and Daman & Diu',
                        'Delhi',
                        'Goa',
                        'Gujarat',
                        'Haryana',
                        'Himachal Pradesh',
                        'Jammu and Kashmir',
                        'Jharkhand',
                        'Karnataka',
                        'Kerala',
                        'Ladakh',
                        'Lakshadweep',
                        'Madhya Pradesh',
                        'Maharashtra',
                        'Manipur',
                        'Meghalaya',
                        'Puducherry'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _selectedState = value;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.03,
                    child: Container(
                      color: _white,
                      child: Text(
                        'State',
                        style: TextStyle(color: _black, fontSize: 12),
                      ),
                    )),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    color: _white,
                    child: DropdownButton<String>(
                      hint: Text('Select City'),
                      isExpanded: true,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_downward),
                      ),
                      underline: Container(
                        color: _black,
                        height: 1,
                      ),
                      value: _selectedCity,
                      items: <String>[
                        'Agartala',
                        'Agra',
                        'Ahmedabad',
                        'Aizwal',
                        'Ajmer',
                        'Alibaug',
                        'Allahabad',
                        'Alleppey',
                        'Almora',
                        'Alsisar',
                        'Alwar',
                        'Ambala',
                        'Amla',
                        'Amritsar',
                        'Anand',
                        'Ankleshwar',
                        'Ashtamudi',
                        'Auli',
                        'Aurangabad',
                        'Baddi',
                        'Badrinath',
                        'Balasinor',
                        'Balrampur',
                        'Bambora',
                        'Bandhavgarh',
                        'Bandipur',
                        'Bangalore',
                        'Barbil',
                        'Bareilly',
                        'Behror',
                        'Belgaum',
                        'Berhampur',
                        'Betalghat',
                        'Bhandardara',
                        'Bharatpur',
                        'Bharuch',
                        'Bhavangadh',
                        'Bhavnagar',
                        'Bhilai',
                        'Bhimtal',
                        'Bhopal',
                        'Bhubaneshwar',
                        'Bhuj',
                        'Bikaner',
                        'Binsar',
                        'Bodhgaya',
                        'Bundi',
                        'Calicut',
                        'Canannore',
                        'Chail',
                        'Chamba',
                        'Chandigarh',
                        'Chennai',
                        'Chikmagalur',
                        'Chiplun',
                        'Chitrakoot',
                        'Chittorgarh',
                        'Coimbatore',
                        'Coonoor',
                        'Coorg',
                        'Corbett National Park',
                        'Cuttack',
                        'Dabhosa',
                        'Dalhousie',
                        'Daman',
                        'Dandeli',
                        'Dapoli',
                        'Darjeeling',
                        'Dausa',
                        'Dehradun',
                        'Dharamshala',
                        'Dibrugarh',
                        'Digha',
                        'Diu',
                        'Dive Agar',
                        'Dooars',
                        'Durgapur',
                        'Durshet',
                        'Dwarka',
                        'Faridabad',
                        'Firozabad',
                        'Ganapatipule',
                        'Gandhidham',
                        'Gandhinagar',
                        'Gangotri',
                        'Gangtok',
                        'Garhmukteshwar',
                        'Garhwal',
                        'Gaya',
                        'Ghaziabad',
                        'Goa',
                        'Gokharna',
                        'Gondal',
                        'Gorakhpur',
                        'Greater Noida',
                        'Gulmarg',
                        'Gurgaon',
                        'Guruvayoor',
                        'Guwahati',
                        'Gwalior',
                        'Halebid',
                        'Hampi',
                        'Hansi',
                        'Haridwar',
                        'Hassan',
                        'Hospet',
                        'Hosur',
                        'Hubli',
                        'Hyderabad',
                        'Idukki',
                        'Igatpuri',
                        'Imphal',
                        'Indore',
                        'Jabalpur',
                        'Jaipur',
                        'Jaisalmer',
                        'Jalandhar',
                        'Jalgaon',
                        'Jambugodha',
                        'Jammu',
                        'Jamnagar',
                        'Jamshedpur',
                        'Jawhar',
                        'Jhansi',
                        'Jodhpur',
                        'Jojawar',
                        'Jorhat',
                        'Junagadh',
                        'Kabini',
                        'Kalimpong',
                        'Kanatal',
                        'Kanchipuram',
                        'Kanha',
                        'Kanpur',
                        'Kanyakumari',
                        'Kargil',
                        'Karjat',
                        'Karnal',
                        'Karur',
                        'Karwar',
                        'Kasargod',
                        'Kasauli',
                        'Kashid',
                        'Kashipur',
                        'Katra',
                        'Kausani',
                        'Kaza',
                        'Kaziranga',
                        'Kedarnath',
                        'Khajjiar',
                        'Khajuraho',
                        'Khandala',
                        'Khimsar',
                        'Kochin',
                        'Kodaikanal',
                        'Kolhapur',
                        'Kolkata',
                        'Kollam',
                        'Kota',
                        'Kotagiri',
                        'Kottayam',
                        'Kovalam',
                        'Kufri',
                        'Kullu',
                        'Kumarakom',
                        'Kumbakonam',
                        'Kumbalgarh',
                        'Kumily',
                        'Kurseong',
                        'Kushinagar',
                        'Lachung',
                        'Lakshadweep',
                        'Leh',
                        'Lonavala',
                        'Lothal',
                        'Lucknow',
                        'Ludhiana',
                        'Lumbini',
                        'Madurai',
                        'Mahabaleshwar',
                        'Mahabalipuram',
                        'Malappuram',
                        'Malpe',
                        'Malshej Ghat',
                        'Malvan',
                        'Manali',
                        'Mandavi',
                        'Mandawa',
                        'Mandormoni',
                        'Manesar',
                        'Mangalore',
                        'Manmad',
                        'Mararri',
                        'Marchula',
                        'Matheran',
                        'Mathura',
                        'Mcleodganj',
                        'Mohali',
                        'Moradabad',
                        'Morbi',
                        'Mount Abu',
                        'Mukteshwar',
                        'Mumbai',
                        'Mundra',
                        'Munnar',
                        'Murud Janjira',
                        'Mussoorie',
                        'Mysore',
                        'Nadukani',
                        'Nagapattinam',
                        'Nagarhole',
                        'Nagaur Fort',
                        'Nagothane',
                        'Nagpur',
                        'Nahan',
                        'Nainital',
                        'Naldhera',
                        'Nanded',
                        'Napne',
                        'Nasik',
                        'Navi Mumbai',
                        'Neral',
                        'New Delhi',
                        'Nilgiri',
                        'Noida',
                        'Ooty',
                        'Orchha',
                        'Osian',
                        'Pachmarhi',
                        'Pahalgam',
                        'Palampur',
                        'Palanpur',
                        'Pali',
                        'Palitana',
                        'Pallakad',
                        'Panchgani',
                        'Panchkula',
                        'Panhala',
                        'Panna',
                        'Pantnagar',
                        'Panvel',
                        'Parwanoo',
                        'Pathankot',
                        'Patiala',
                        'Patna',
                        'Patnitop',
                        'Pelling',
                        'Pench',
                        'Phagwara',
                        'Phalodi',
                        'Pinjore',
                        'Pondicherry',
                        'Poovar',
                        'Porbandar',
                        'Port Blair',
                        'Poshina',
                        'Pragpur',
                        'Pune',
                        'Puri',
                        'Puskhar',
                        'Puttaparthi',
                        'Rai Bareilly',
                        'Raichak',
                        'Raipur',
                        'Rajahmundry',
                        'Rajasthan',
                        'Rajgir',
                        'Rajkot',
                        'Rajpipla',
                        'Rajsamand',
                        'Ram Nagar',
                        'Rameshwaram',
                        'Ramgarh',
                        'Ranakpur',
                        'Ranchi',
                        'Ranikhet',
                        'Ranny',
                        'Ranthambore',
                        'Ratnagiri',
                        'Ravangla',
                        'Rishikesh',
                        'Rishyap',
                        'Rohetgarh',
                        'Rourkela',
                        'Sajan',
                        'Salem',
                        'Saputara',
                        'Sasan Gir',
                        'Sattal',
                        'Sawai Madhopur',
                        'Sawantwadi',
                        'Secunderabad',
                        'Sharavanbelgola',
                        'Shillong',
                        'Shimla',
                        'Shimlipal',
                        'Shirdi',
                        'Shivanasamudra',
                        'Siana',
                        'Siliguri',
                        'Silvassa',
                        'Sivaganga District',
                        'Solan',
                        'Sonauli',
                        'Srinagar',
                        'Sunderban',
                        'Surat',
                        'Tanjore',
                        'Tapola',
                        'Tarapith',
                        'Thane',
                        'Thekkady',
                        'Thiruvananthapuram',
                        'Thirvannamalai',
                        'Thrissur',
                        'Tiruchirapalli',
                        'Tirupati',
                        'Tirupur',
                        'Udaipur',
                        'Udhampur',
                        'Udupi',
                        'Ujjain',
                        'Uttarkashi',
                        'Vadodara',
                        'Vagamon',
                        'Vapi',
                        'Varanasi',
                        'Varkala',
                        'Velankanni',
                        'Vellore',
                        'Veraval',
                        'Vijayawada',
                        'Vikramgadh',
                        'Vishakapatnam',
                        'Wankaner',
                        'Wayanad',
                        'Yamunotri',
                        'Yercaud',
                        'Yuksom'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _selectedCity = value;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.03,
                    child: Container(
                      color: _white,
                      child: Text(
                        'City',
                        style: TextStyle(color: _black, fontSize: 12),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.09,
                child: RaisedButton(
                  color: _white,
                  onPressed: () {
                    setState(() {
                      _jobTitle.text.isEmpty
                          ? _jobTitileValidate = true
                          : _jobTitileValidate = false;
                      _salary.text.isEmpty
                          ? _salaryValidate = true
                          : _salaryValidate = false;
                      _vacancy.text.isEmpty
                          ? _vacancyValidate = true
                          : _vacancyValidate = false;
                    });
                  },
                  child: Text(
                    'Update Job',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
