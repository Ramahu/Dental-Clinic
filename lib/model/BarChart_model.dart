import 'package:charts_flutter/flutter.dart' as charts;

import '../shared/components/constants.dart';


final List<BarChartModel> chartModel =[
  BarChartModel(
    doctorName: 'Rama' ,
    percent: 40,
    color: charts.ColorUtil.fromDartColor(defaultGreen),
  ),

  BarChartModel(
    doctorName: 'Batoul',
    percent: 30,
    color: charts.ColorUtil.fromDartColor(indigoAccent),
  ),
  BarChartModel(
    doctorName: 'Jamal' ,
    percent: 60,
    color: charts.ColorUtil.fromDartColor(redAccent),
  ),
  BarChartModel(
    doctorName: 'Jawad' ,
    percent: 90,
    color: charts.ColorUtil.fromDartColor(yellow),
  ),

];

class BarChartModel{
  String doctorName;
  int percent;
   final charts.Color color;

  BarChartModel({
    required this.doctorName,
    required this.percent,
    required this.color,
});


}