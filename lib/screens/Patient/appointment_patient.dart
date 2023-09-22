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
        title:  ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text('All Appointment',
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
        child :
        Obx( () {
          if (appController.isLoading.isTrue) {
            return Center(
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