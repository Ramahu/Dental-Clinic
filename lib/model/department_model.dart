import 'dart:convert';
import 'package:flutter/material.dart';

AllDepartmentModel AllDepartmentModelFromJson(String str ) => AllDepartmentModel.fromJson(json.decode(str));

class AllDepartmentModel{
  AllDepartmentModel({
    required this.Departments,
  });

  List<DepartmentModel> Departments ;

  factory AllDepartmentModel.fromJson(Map<String,dynamic>json)=> AllDepartmentModel(
    Departments: List<DepartmentModel>.from(json["message"].map((x)=>DepartmentModel.fromJson(x))),
  );


}

class DepartmentModel {
   int? id;
   String? speciality;
   String? openTime;
   String? closeTime;

  DepartmentModel({
    this.id,
    this.speciality,
    this.openTime,
    this.closeTime
});
   DepartmentModel.fromJson(Map<String,dynamic>json){
     id=json['id'];
     speciality=json['name'];
     openTime=json['open_time'];
     closeTime=json['close_time'];
   }

}