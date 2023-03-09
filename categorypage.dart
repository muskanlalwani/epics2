// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CategoryPage extends StatelessWidget {
//   final String category;

//   const CategoryPage({required this.category, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurpleAccent,
//         title: Text(category),
//       ),
//       body: Center(
//         child: Text('Category: $category'),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({required this.category, Key? key}) : super(key: key);

  Future<void> _launchPDF() async {
    const url =
        'https://education.ucsb.edu/sites/default/files/hosford_clinic/docs/adhd_booklet.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(category),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Attention-deficit/hyperactivity disorder (ADHD) is a neurodevelopmental disorder that affects both children and adults. ADHD is characterized by inattention, hyperactivity, and impulsivity. Some common symptoms of ADHD include:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Inattention:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Difficulty paying attention to details\n- Easily distracted\n- Forgetfulness\n- Difficulty following instructions or completing tasks',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Hyperactivity:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Restlessness\n- Excessive talking\n- Difficulty sitting still\n- Fidgeting\n- Interrupting others',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Impulsivity:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Impatience\n- Acting without thinking\n- Interrupting others\n- Difficulty waiting their turn\n- Taking unnecessary risks',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Treatment options for ADHD include medication, therapy, and lifestyle changes such as exercise, a healthy diet, and getting enough sleep. It is important to work with a healthcare provider to determine the best treatment plan for you or your child. ',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextButton.icon(
                onPressed: _launchPDF,
                icon: Icon(Icons.download),
                label: Text(
                  'Download PDF to read more',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
