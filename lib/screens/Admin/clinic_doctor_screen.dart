import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/model/doctor_model.dart';
import 'package:rama/screens/Admin/Add_Doctor.dart';
import '../../controller/doctor_controller.dart';
import '../../model/doctor_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';


class Clinic_Doctors extends StatelessWidget {

  DoctorController doctorController=Get.put(DoctorController());
  //DoctorController doctorController= Get.find();

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
          child:  Text("All Doctors",
            style:  GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
        ),
        backgroundColor: white ,
        iconTheme:  const IconThemeData(color: grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
            child :
           Obx( () {
             if (doctorController.isLoading.isTrue) {
               return  Center(
                 child: SpinKitFadingCircle(
                   itemBuilder: (BuildContext context, int index) {
                     return DecoratedBox(
                       decoration: BoxDecoration(
                         color: defaultGreen,
                         borderRadius: BorderRadiusDirectional.circular(10.0),
                       ),
                     );
                   },
                 ),
               );
             }
             else if(doctorController.DoctorList.isEmpty)
               {
                 return const Center(
                   child: Text('No doctor yet'),
                 );
               }
             return defaultPull(
             function: handleRefresh,
             list: ListView.separated(
             itemBuilder: (context, index) => buildDocItem(context,
                 doctorController.DoctorList[index],
             ),
             separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
             itemCount: doctorController.DoctorList.length,
             ),
             );
           }),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Get.to(  AddDoctor(),); },
        backgroundColor: defaultGreen ,
        highlightElevation: 70,
        child: const Icon(FluentIcons.people_add_16_regular ,size: 30),
      ),
    );
  }

  Widget buildDocItem(BuildContext context , DoctorModel ? doctor) =>
      Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.50,
          motion: const StretchMotion (),
          children: [
          SlidableAction(
             onPressed:(context){
               defaultAlert(context:context,
                 function:(){
                 Get.back();
                 }
               );
            },
            backgroundColor: grey,
            foregroundColor: white,
            icon: Icons.archive_rounded,
            label: 'Archive',
          ),
        ],
        ),
        child: InkWell(
          onTap: (){},
          highlightColor: grey,
          child: Container(
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
                  const SizedBox(width: 10.0,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(60.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:Image( image:
                    NetworkImage('${doctor?.image}'),
                      fit: BoxFit.cover,)
                    //Image.file(File('http://192.168.1.110:8000${doctor?.image}'),fit: BoxFit.cover,),
                    ),


                  const SizedBox(width: 15.0,),
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('${doctor!.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,)
                        ,),
                      const SizedBox(height: 3.0,),
                      Text('speciality : ${doctor.speciality}',
                        maxLines: 2,
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
          ),
        ),
      );

}
