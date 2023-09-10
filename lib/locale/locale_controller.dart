import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../shared/local/cache_helper.dart';

class MyLocalController extends GetxController {
  Locale initialLang = CacheHelper.getData(key: "lang") == "ar" ? Locale("ar") : Locale("en") ;
  var lang = CacheHelper.getData(key: "lang");

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    CacheHelper.saveData(key: "lang", value: codelang);

    Get.updateLocale(locale);
  }
}
