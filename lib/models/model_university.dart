// To parse this JSON data, do
//
//     final modelDataUniversity = modelDataUniversityFromJson(jsonString);

import 'dart:convert';

ModelDataUniversity modelDataUniversityFromJson(String str) => ModelDataUniversity.fromJson(json.decode(str));

String modelDataUniversityToJson(ModelDataUniversity data) => json.encode(data.toJson());

class ModelDataUniversity {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelDataUniversity({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelDataUniversity.fromJson(Map<String, dynamic> json) => ModelDataUniversity(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String univName;
  String univImage;
  String univDesc;
  String univAddress;
  String univEmail;
  String univLatMap;
  String univLongMap;

  Datum({
    required this.id,
    required this.univName,
    required this.univImage,
    required this.univDesc,
    required this.univAddress,
    required this.univEmail,
    required this.univLatMap,
    required this.univLongMap,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    univName: json["univ_name"],
    univImage: json["univ_image"],
    univDesc: json["univ_desc"],
    univAddress: json["univ_address"],
    univEmail: json["univ_email"],
    univLatMap: json["univ_lat_map"],
    univLongMap: json["univ_long_map"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "univ_name": univName,
    "univ_image": univImage,
    "univ_desc": univDesc,
    "univ_address": univAddress,
    "univ_email": univEmail,
    "univ_lat_map": univLatMap,
    "univ_long_map": univLongMap,
  };
}
