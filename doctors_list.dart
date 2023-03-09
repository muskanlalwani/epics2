import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade200,
          title: Text(user.title),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.network(user.imageurl)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
              child: Text(
                (user.degree),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 4, 0, 20),
              child: Text(
                ('"RCI Registered"'),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigoAccent.shade400,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
              constraints: BoxConstraints(maxWidth: 380),
              child: Text(
                (user.description),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
              child: Text(
                (user.expert),
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red.shade300),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(11, 0, 0, 57),
              child: Text((user.time),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red.shade300)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 70,
                        child: Image.network(
                            'https://www.pearson.com/uk/content/dam/one-dot-com/one-dot-com/english/versant-test/Pictogram-RGB-Orange_Speech%20bubble.png'),
                        //  fit: BoxFit.cover,
                      ),
                      Text(
                        ('Speaks:'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 267, 0),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 45,
                    height: 60,
                    child: Image.network(
                        'https://image.pngaaa.com/613/3797613-middle.png'),
                  ),
                  Text(
                    ('Experience:'),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
}

class User {
  String title;
  String description;
  String imageurl;
  String degree;
  String expert;
  String time;

  User({
    required this.title,
    required this.degree,
    required this.description,
    required this.imageurl,
    required this.expert,
    required this.time,
  });
}

class DoctorPageui extends StatefulWidget {
  const DoctorPageui({Key? key}) : super(key: key);
  @override
  _DoctorPageuiState createState() => _DoctorPageuiState();
}

class _DoctorPageuiState extends State<DoctorPageui> {
  List<User> users = [
    User(
        expert: 'Expertise in :xyx',
        time: 'Time: Mon - Sat(11:00 AM - 02:30 PM) and Fees:Rs1500',
        title: 'Dr Rajlaxmi Shukla',
        degree: 'MA(Psychologist)',
        description:
            ' Her counselling is based on the principle of Guidance & Counseling with a gentle touch. She is an expert dietitian and a trainer in Yogic Science. She has more than 25 years experience in counselling and guiding people.She is registered as a professional psychologist from RCI. She is a trained expert in the field of psychology, counselling, assessment, psychological therapeutics, organizational behaviour and skills development.  ',
        imageurl:
            'https://o.remove.bg/downloads/d53465e6-da08-4aa5-a427-5dd4b80a8ab0/de2-removebg-preview.png'),
    User(
        expert: 'Expertise in: abc',
        time:
            'TIme:Mon - Sun(09:00 AM - 05:45 PM) and (07:00 PM - 09:00 PM) and fees:Rs500',
        title: 'Dr Sanjeev Tripathi',
        degree: 'MA, M.PHIL(Psychologist)',
        description:
            'Mr. Sanjeev consultant clinical psychologist in the greater Kailash hospital, Indore. Ex. A clinical psychologist in M.G.M. Medical college, Indore. He a registered professional with rci New Delhi (govt. Of India). . He did M. Phil in medical and social psychology from rci recognized pig bams, Raipur, and pgdgc from rdvv Jabalpur. He presuming ph.D. In davv, Indore. He has been trained in the field of psychotherapy, psychological counseling, family therapy, psychological assessment, psychological therapeutics, hypnotherapy, including health and organizational psychology.',
        imageurl:
            'https://o.remove.bg/downloads/fd432b30-4fba-41ab-a231-41b18295dc62/de-removebg-preview.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Available Doctors'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                  child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(user.imageurl[index]),
                ),
                title: Text(user.title),
                subtitle: Text(user.degree),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => UserPage(user: user))));
                },
              ));
            }));
  }
}
