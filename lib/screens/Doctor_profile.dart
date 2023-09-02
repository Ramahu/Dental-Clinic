import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rama/model/doctor_model.dart';
import 'package:rama/screens/Patient/add_apoitment.dart';
import '../Network/DataBaseHelper.dart';
import '../controller/doctor_controller.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class DoctorProfile extends StatelessWidget{
  final DoctorModel? doctor;
      DoctorProfile({Key? key,  required this.doctor}) : super(key: key);
  DoctorController doctorController= Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:  SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Container(
         width: double.infinity,
         decoration: BoxDecoration(
           image: DecorationImage(image:NetworkImage('${doctor?.image}',
    ),
           alignment: Alignment.topCenter,
             fit: BoxFit.fitWidth,
           ),
           gradient: const LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [orange1,orange2],
           ),
       ),
         child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      backCircle(),
      SizedBox(height: MediaQuery.of(context).size.height*0.5,),
      Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: white,
            borderRadius:  BorderRadius.vertical(top: Radius.circular(50)),
          ),
    child: Padding(
         padding: const EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0,),
              Text(' Dr. ${doctor?.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,)
                ,),
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Icon(Icons.category, color: indigoAccent ,),
                  Text('${doctor?.speciality}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 14.0,
                        color:grey, )
                  ),
                  const SizedBox(width: 30,),
                  const Icon(Icons.phone, color: indigoAccent ,),
                  Text('${doctor?.phone}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 14.0,
                        color:grey, )
                  ),
                  const SizedBox(width: 30,),

                ],
              ),

              const SizedBox(height: 30.0,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('About',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: grey, )
                              ),
                              const SizedBox(height: 8.0,),
                              Text(' ${doctor?.description} ',
                                    maxLines: null,
                                    style:const TextStyle(
                                      fontSize: 14.0,
                                      color: grey, )
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0,),
              defaultGradientBottom(text: 'Add Appointment' ,
                            width: 250.0,
                            height: 60.0,
                  color1: orange1,
                  color2: orange2,
                            function: ()async{
                              Get.to( AddAppointment( doctor: doctor,),);
                          await DataBaseHelper.sendNotification('Hi Dr.${doctor?.name}',
                              'user name added a new appointment to you.',
                              '1');
                            }
                            ),
                        const SizedBox(height: 30.0,),

          ],
    ),
    ),
        ),
           ],
        ),
    ),
       ),
   );
  }
}