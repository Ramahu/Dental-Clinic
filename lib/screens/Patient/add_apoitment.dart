import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Network/DataBaseHelper.dart';
import '../../controller/patient/patient_appointment_controller.dart';
import '../../model/doctor_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';

class AddAppointment extends StatelessWidget{

  final DoctorModel? doctor;
  AddAppointment({Key? key,  required this.doctor}) : super(key: key);
  PatientAppointmentController appController= Get.put(PatientAppointmentController());
  var formkey = GlobalKey<FormState>();
  String  token = CacheHelper.getData(key: "token");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title:  ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: [Green1,Green2],).createShader(rect),
                child:  Text('Add Appointment',
                  style:  GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                ),
              ),
              backgroundColor: white ,
              iconTheme:  const IconThemeData(color: grey),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        const SizedBox(height: 120.0,),
                        Row(
                          children: [
                            const SizedBox(width: 4.0,),
                            const Icon(Icons.person, color: indigoAccent ,),
                            const Text(' Doctor Name :',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:indigoAccent, )
                            ),
                            Text('${doctor?.name}',
                                style:const TextStyle(
                                  fontSize: 16.0,
                                  color:Colors.black87, )
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0,),
                  Row(
                      children: [
                        const SizedBox(width: 4.0,),
                        const Icon(Icons.category, color: indigoAccent ,),
                        const Text(' Department :',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: indigoAccent, )
                        ),
                        Text(' ${doctor?.speciality}',
                            style:const TextStyle(
                              fontSize: 16.0,
                              color:Colors.black87, )
                        ),
  ],
                  ),
                        const SizedBox(height: 30.0,),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            appController.chooseAppointmentDate();
                          },
                          icon: const Icon(
                            Icons.date_range_outlined,
                            color: indigoAccent,
                          ),
                          label: const Text(
                            'Choose appointment date :',
                            style: TextStyle(
                              color:indigoAccent,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        Text(
                          "${appController.appDate.value.year}:"
                          "${appController.appDate.value.month}, "
                          "${appController.appDate.value.day}",
                          style: const TextStyle(
                            color: black54,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                        const SizedBox(height: 20.0,),
                    Obx(
                      () => Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              appController.chooseAppointmentTime();
                            },
                            icon: const Icon(
                              Icons.access_time_outlined,
                              color: indigoAccent,
                            ),
                            label: const Text(
                              'Choose appointment time :',
                              style: TextStyle(
                                color: indigoAccent,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                          Text(
                            "${appController.appTime.value.hour}:"
                            "${appController.appTime.value.minute}, ",
                            style: const TextStyle(
                              color: black54,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
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
                          DataBaseHelper.addappoitment(
                            token: token.toString(),
                            doctorId: doctor!.doctorId,
                              //departmentId: doctor!.departmentId,
                              //patientId: userId,
                              appdate: appController.appDate.value,
                              apptime: appController.appTime.value,
                          );
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
