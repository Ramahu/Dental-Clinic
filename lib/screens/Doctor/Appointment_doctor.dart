import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/doctor/doctor_Appointment_Controller.dart';
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
        title: defaultTitle(
          text: "All Appointment",
          fontSize: 20.0,
          color1: Green1,
          color2: Green2,
        ),
        backgroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child :
        Obx( () {
          if (appController.isLoading.isTrue) {
            return  Center(
              child: loadingCircle(color: defaultGreen),
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
              itemBuilder: (context, index) => appointmentItem(
                appointment: appController.AppointmentList[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
              itemCount: appController.AppointmentList.length,
            ),
          );
        }),
      ),
    );
  }

  // Widget buildAppItem(BuildContext context , AppointmentModel ? appointment) =>
  //     Container(
  //       padding: const EdgeInsets.all(14.0),
  //       decoration:  BoxDecoration(
  //         borderRadius: BorderRadius.circular(200),
  //         color: white,
  //         boxShadow: const [
  //           BoxShadow(
  //             offset: Offset(0,2),
  //             blurRadius: 5,
  //             color: grey,
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         children: [
  //           const SizedBox(width: 15.0,),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children:  [
  //                 Text('${appointment!.patientName}',
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                   style:const TextStyle(
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,)
  //                   ,),
  //                 Text('Date : ${appointment.appDate}',
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                   style:const TextStyle(
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,)
  //                   ,),
  //                 const SizedBox(height: 3.0,),
  //                 Text( 'Time : ${appointment.appTime}',
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style:const TextStyle(
  //                       fontSize: 14.0,
  //                       color: grey, )
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

}

