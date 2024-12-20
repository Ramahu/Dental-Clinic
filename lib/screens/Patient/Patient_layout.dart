import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/patient/Patient_Home_controller.dart';
import '../../locale/locale_controller.dart';
import '../../shared/components/constants.dart';
import '../Signin.dart';
import 'Home_patient.dart';
import 'appointment_patient.dart';

class PatientLayout extends StatelessWidget{

  PatientHomeController homeController= Get.put(PatientHomeController());
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  MyLocalController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Scaffold(
      body: IndexedStack(
          index: homeController.tabIndex.toInt(),
          children: [
            PatientHome(),
            AppointmentPatient(),
          ],
        ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: const <Widget>[
          Icon(FluentIcons.dentist_12_regular ,size: 30),
          Icon(FluentIcons.task_list_square_ltr_16_regular, size: 30),
        ],
        key: bottomNavigationKey,
        color: white,
        buttonBackgroundColor: const Color(0xE8FF9785),
        backgroundColor: const Color(0x884476A3),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: homeController.changeTabIndex,
        index: homeController.tabIndex.toInt(),
    ),
          ),
    );
  }

}