import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/doctor/Doctor_Home_controller.dart';
import '../../shared/components/constants.dart';
import 'All_patients.dart';
import 'Appointment_doctor.dart';
import 'home_doctor.dart';


class DoctorLayout extends StatelessWidget{

  DoctorHomeController homeController= Get.put(DoctorHomeController());
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Scaffold(
          body: IndexedStack(
            index: homeController.tabIndex.toInt(),
            children: [
              HomeDoctor(),
              AppointmentDoctor(),
              Clinic_Patient(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            items: const <Widget>[
              Icon(FluentIcons.dentist_12_regular ,size: 30),
              Icon(FluentIcons.task_list_square_ltr_16_regular, size: 30),
              //Icon(Icons.person, size: 30),
              // Icon(FluentIcons.people_12_regular ,size: 30),
              Icon(FluentIcons.patient_20_regular, size: 30),
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