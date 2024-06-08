import 'package:flutter/material.dart';
import 'package:uitm_8jun/models/model_university.dart';


class PageDetailUniv extends StatelessWidget {


  final Datum university;
  const PageDetailUniv({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    double? latUniv = double.tryParse(university.univ_lat_map);
    double? longUniv = double.tryParse(university.univ_long_map);

    return Scaffold(
      appBar: AppBar(
        title: Text('${university.univName}',  style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10,),
        child : Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children:[
            ClipRRect(
              borderRadius : BorderRadius.circular(10),
              child : Image.network('http://192.168.1.3:8080/server_university/images/${data?.univImage}',
                height: 100,
                width : double.infinity
                fit: BoxFit.fill,
              ),
            ),
            Sizebox(height : 10),
            Text(university.univName),
            Sizebox(height : 10),
            Text(university.univ_address),
            Sizebox(height : 10),
            Text(university.univ_email),
            Sizebox(height : 10),
            Text(university.univ_desc),

          ]
        )

      )
    );
  }
}

