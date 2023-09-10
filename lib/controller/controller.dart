import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class Controller extends GetxController {

  final GlobalKey<SliderDrawerState> sliderDrawerKey = GlobalKey<SliderDrawerState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    //scaffoldKey.currentState!.openDrawer();
    sliderDrawerKey.currentState!.openSlider();
  }

  void closeDrawer() {
    //scaffoldKey.currentState!.openEndDrawer();
    sliderDrawerKey.currentState!.closeSlider();
  }
}
