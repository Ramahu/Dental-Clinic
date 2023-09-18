import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';
import '../../Network/DataBaseHelper.dart';
import '../../controller/patient/patient_appointment_controller.dart';
import '../../model/doctor_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';

class AddAppointment extends StatelessWidget{

  final DoctorModel? doctor;
  AddAppointment({Key? key, required this.doctor}) : super(key: key);
  PatientAppointmentController appController= Get.put(PatientAppointmentController());
  var formkey = GlobalKey<FormState>();
  //String  token = CacheHelper.getData(key: "token");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title:  ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: [Green1,Green2],).createShader(rect),
                child:  Text('   Dr. ${doctor?.name}',
                  style:  GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              backgroundColor: white ,
              iconTheme:  const IconThemeData(color: grey),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        const SizedBox(height: 20.0,),
                    // Row(
                    //   children: [
                    //     TextButton.icon(
                    //       onPressed: () {
                    //         appController.chooseAppointmentDate();
                    //       },
                    //       icon: const Icon(
                    //         Icons.date_range_outlined,
                    //         color: indigoAccent,
                    //       ),
                    //       label: const Text(
                    //         'Choose appointment date :',
                    //         style: TextStyle(
                    //           color:indigoAccent,
                    //           fontSize: 13.0,
                    //         ),
                    //       ),
                    //     ),
                    //     Text(
                    //       "${appController.appDate.value.year}:"
                    //       "${appController.appDate.value.month}, "
                    //       "${appController.appDate.value.day}",
                    //       style: const TextStyle(
                    //         color: black54,
                    //         fontSize: 11.0,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: indigoAccent,
                          selectedTextColor: white,
                          onDateChange: (date) {
                            appController.appoDate.value = date;
                            print( appController.appoDate.value);
                          },
                        ),
                        const SizedBox(height: 20.0,),
                    // Obx(
                    //   () => Row(
                    //     children: [
                    //       TextButton.icon(
                    //         onPressed: () {
                    //           appController.chooseAppointmentTime();
                    //         },
                    //         icon: const Icon(
                    //           Icons.access_time_outlined,
                    //           color: indigoAccent,
                    //         ),
                    //         label: const Text(
                    //           'Choose appointment time :',
                    //           style: TextStyle(
                    //             color: indigoAccent,
                    //             fontSize: 13.0,
                    //           ),
                    //         ),
                    //       ),
                    //       Text(
                    //         "${appController.appTime.value.hour}:"
                    //         "${appController.appTime.value.minute}, ",
                    //         style: const TextStyle(
                    //           color: black54,
                    //           fontSize: 11.0,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                        TimesSlotGridViewFromInterval(
                          locale: "en",
                          initTime: DateTime.now(),
                          selectedColor: indigoAccent,
                          crossAxisCount: 4,
                          timeSlotInterval: const TimeSlotInterval(
                            start: TimeOfDay(hour: 9, minute: 00),
                            end: TimeOfDay(hour: 21, minute: 0),
                            interval: Duration(hours: 0, minutes: 30),
                          ),
                          onChange: (time) {
                            appController.appoTime.value = time;
                            print( appController.appoTime.value);
                          },
                        ),
                        const SizedBox(height: 50.0,),

                        defaultGradientBottom(
                      text: 'Add',
                      width:MediaQuery.of(context).size.width * 0.9,
                      height: 40.0,
                          color1:  indigoAccent,
                          color2: Green2,
                      function: () {
                        if (formkey.currentState!.validate()) {
                          // DataBaseHelper.addappoitment(
                          //   token: token.toString(),
                          //   doctorId: doctor!.doctorId,
                          //     //departmentId: doctor!.departmentId,
                          //     //patientId: userId,
                          //     appdate: appController.appoDate.value,
                          //     apptime: appController.appoTime.value,
                          // );
                          Get.back();
                        }
                      },
                    ),
                        const SizedBox(height: 40.0,),
                  ]),
                ),
              ),
            )
    );
  }
}
