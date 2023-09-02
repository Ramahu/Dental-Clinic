import 'dart:io';
import 'package:flutter/material.dart';
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
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: grey,
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
            return const Center(
              child: CircularProgressIndicator(
                color: defaultGreen,
                strokeWidth: 5,
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
              itemBuilder: (context, index) => buildPatItem(context, patientController.patientList[index]),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 12.0,),
              itemCount: patientController.patientList.length,
            ),
          );
        }),
      ),

    );
  }

  Widget buildPatItem(BuildContext context, PatientModel? patient,) => InkWell(
          onTap: () {
            Get.to(alldiagnoses(patient:patient
                 ));
          },
          highlightColor: grey,
          child: Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  color: grey,
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${patient?.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
      );
}
