import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text('Universiti Teknologi MARA Cawangan Melaka (UiTM CM)',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20,),
            Image.asset('gambar/gambar2.jpeg', height: 100,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Temporary placement at the Institut Kemahiran MARA (IKM) on Hang Tuah Road. At the beginning there were only 32 support staff and 5 lecturers. There were only 158 students and the courses offered were Diploma in Public Administration (DPA), Diploma in Business Studies (DBS), Diploma in Accounting (DIA) and Diploma in Secretarial Science (DSS).'),
            )
          ],
        ),
      ),
    );
  }
}
