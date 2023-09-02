import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../main.dart';

class MyLocalController extends GetxController {
  Locale initialang =
      sharepref!.getString("lang") == "ar" ? Locale("ar") : Locale("en");

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    sharepref!.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
