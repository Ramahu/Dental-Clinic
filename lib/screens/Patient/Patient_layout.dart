import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/patient/Patient_Home_controller.dart';
import '../../shared/components/constants.dart';
import 'Home_patient.dart';
import 'appointment_patient.dart';

class PatientLayout extends StatelessWidget{

  PatientHomeController homeController= Get.put(PatientHomeController());
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

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
          Icon(Icons.home, size: 30),
          Icon(Icons.date_range, size: 30),
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