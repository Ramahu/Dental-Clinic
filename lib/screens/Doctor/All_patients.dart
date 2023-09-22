import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/patient_controller.dart';
import '../../model/patient_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'All_diagnosis.dart';

class Clinic_Patient extends StatelessWidget {
  PatientController patientController = Get.put(PatientController());

  Future<void> handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text( "Al patients",
            style:  GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
        ),
            backgroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (patientController.isLoading.isTrue) {
            return  Center(
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color:   defaultGreen,
                      borderRadius: BorderRadiusDirectional.circular(10.0),
                    ),
                  );
                },
              ),
            );
          }
          else if(patientController.patientList.isEmpty)
          {
            return Center(
              child: Text('NO patient yet'.tr,
                 ),
            );
          }
          return defaultPull(
            function: handleRefresh,
            list: ListView.separated(
              itemBuilder: (context, index) =>  patientItem(
                  patient: patientController.patientList[index],
                  function: () {
                    Get.to(alldiagnoses(patient:patientController.patientList[index]));
                  },
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 12.0,),
              itemCount: patientController.patientList.length,
            ),
          );
        }),
      ),

    );
  }
}
