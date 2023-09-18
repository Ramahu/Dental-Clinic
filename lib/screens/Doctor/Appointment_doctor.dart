import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/doctor/doctor_Appointment_Controller.dart';
import '../../model/appotmentmodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class AppointmentDoctor extends StatelessWidget {

  DoctorAppointmentController appController= Get.put(DoctorAppointmentController());

  Future<void> handleRefresh() async{
    return await Future.delayed(const Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text('All Appointment',
            style:  GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
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
          else if(appController.AppointmentList.isEmpty)
          {
            return const Center(
              child: Text('No appointment yet'),
            );
          }
          return defaultPull(
            function: handleRefresh,
            list: ListView.separated(
              itemBuilder: (context, index) => buildAppItem(context,
                appController.AppointmentList[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
              itemCount: appController.AppointmentList.length,
            ),
          );
        }),
      ),
    );
  }

  Widget buildAppItem(BuildContext context , AppointmentModel ? appointment) =>
      Container(
        padding: const EdgeInsets.all(14.0),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,2),
              blurRadius: 5,
              color: grey,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Dr.${appointment!.patientName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,)
                    ,),
                  Text('Date : ${appointment.appDate}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,)
                    ,),
                  const SizedBox(height: 3.0,),
                  Text( 'Time : ${appointment.appTime}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 14.0,
                        color: grey, )
                  ),
                ],
              ),
            ),
          ],
        ),
      );

}

