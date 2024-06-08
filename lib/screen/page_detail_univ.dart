import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uitm_8jun/models/model_university.dart';

class PageDetailUniv extends StatelessWidget {


  final Datum university;
  const PageDetailUniv({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    double? latUniv = double.tryParse(university.univLatMap);
    double? longUniv = double.tryParse(university.univLongMap);

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
              child : Image.network('http://192.168.1.3:8080/server_university/images/${university?.univImage}',
                height: 125,
                width : double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height : 10),
            Text(university.univName),
            SizedBox(height : 10),
            Text(university.univAddress),
            SizedBox(height : 10),
            Text(university.univEmail),
            SizedBox(height : 10),
            Text(university.univDesc),
            SizedBox(height: 10,),
            Container(
              height: 300,
              child: GoogleMap(
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(latUniv ?? 0.0, longUniv ?? 0.0),
                  zoom: 17
                ),
                mapType: MapType.normal,
                markers: {
                  Marker(
                    markerId: MarkerId(university.univName),
                    position: LatLng(latUniv ?? 0.0, longUniv ?? 0.0),
                    infoWindow: InfoWindow(
                      title: university.univName,
                      snippet: university.univAddress
                    )
                  )
                }

              ),
            )



          ]
        )

      )
    );
  }
}

