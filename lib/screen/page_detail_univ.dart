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
        title: Text('${university.univName}'),
      ),
    );
  }
}

