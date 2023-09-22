import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/patient/patient_appointment_controller.dart';
import '../../model/appotmentmodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class AppointmentPatient extends StatelessWidget {

  PatientAppointmentController appController= Get.put(PatientAppointmentController());

  Future<void> handleRefresh() async{
    return await Future.delayed(const Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  defaultTitle(
          text:'All Appointment',
          fontSize: 20.0,
          color1: defaultGreen,
          color2: defaultGreen3,
        ),
        backgroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child :
        Obx( () {
          if (appController.isLoading.isTrue) {
            return Center(
              child: loadingCircle(color: defaultGreen),
            );
          }
          else if(appController.appointmentList.isEmpty)
          {
            return const Center(
              child: Text('No appointment yet'),
            );
          }
          return defaultPull(
            function: handleRefresh,
            list: ListView.separated(
              itemBuilder: (context, index) => appointmentItem(
                appointment: appController.appointmentList[index],
                isPatient: true,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
              itemCount: appController.appointmentList.length,
            ),
          );
        }),
      ),
    );
  }
}