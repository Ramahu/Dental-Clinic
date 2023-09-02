import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../shared/components/constants.dart';

// class PieData{
  final List<PieChartModel> data =[
    PieChartModel(
      departmentName: 'ray' ,
      percent: 40,
      color: defaultGreen,
    ),
    PieChartModel(
      departmentName: 'kids teeth' ,
      percent: 70,
      color: indigoAccent,
    ),
    PieChartModel(
      departmentName: 'cosmetic dentistry' ,
      percent: 20,
      color: yellow,
    ),
    PieChartModel(
      departmentName: 'treat' ,
      percent: 50,
      color: orange1,
    ),

  ];
//}
class PieChartModel{
  String departmentName;
  double percent;
  Color color;
  //final charts.Color color;

  PieChartModel({
    required this.departmentName,
    required this.percent,
    required this.color,
  });
}