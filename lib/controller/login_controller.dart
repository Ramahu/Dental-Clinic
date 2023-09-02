import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class SigninController extends GetxController {

  final controller = LiquidController();
  var selectedOption = ''.obs;
  bool isPassword = true;
  IconData suffix =Icons.visibility_outlined;
  //bool visibilityState = true;

   changeVisibility(){
    // isPassword = !isPassword;
   // suffix = isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined ;
   // visibilityState = false;

  }

}
