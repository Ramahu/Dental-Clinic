import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/admin/admin_HomeController.dart';
import '../../shared/components/constants.dart';
import 'clinic_Article_screen.dart';
import 'clinic_depart_screen.dart';
import 'clinic_doctor_screen.dart';
import 'home_admin.dart';

class AdminLayout extends StatelessWidget{

  AdminHomeController homeController= Get.put(AdminHomeController());
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Scaffold(
          body: IndexedStack(
            index: homeController.tabIndex.toInt(),
            children: [
              HomeAdmin(),
              Clinic_Doctors(),
              ClinicDep(),
              ClinicArticle(),
              //diagnoses
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            items: const <Widget>[
              Icon(FluentIcons.dentist_12_regular ,size: 30),
              Icon(FluentIcons.people_12_regular ,size: 30),
              //Icon(Icons.person, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.text_snippet_outlined, size: 30),
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