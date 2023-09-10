import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Doctor_profile.dart';
import '../controller/dep_doc_con.dart';
import '../model/department_model.dart';
import '../model/doctor_model.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class DepDoc extends StatelessWidget{

  final DepartmentModel? department;
  DepDoc({Key? key,  required this.department}) : super(key: key);
  DepDocController docController= Get.put(DepDocController());

  Future<void> handleRefresh() async{
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    departmentId = department!.id!;

    return Scaffold(
      appBar: AppBar(
        title:   ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text('${department!.speciality}',
            style:  GoogleFonts.cookie(
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
        child :
        Obx( () {
          if (docController.isLoading.isTrue) {
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
          else if (docController.docList.isEmpty) {
            return const Center(
              child: Text('No doctor yet'),
            );
          }
          // else if (docController.docList[].departmentId == department!.id!) {
            return defaultPull(
              function: handleRefresh,
              list: ListView.separated(
                itemBuilder: (context, index) =>
                    buildDepItem(context, docController.docList[index]),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 12.0,),
                itemCount: docController.docList.length,
              ),
            );
          // }
          // return Container();
        }
        ),
      ),
    );
  }
  Widget buildDepItem(BuildContext context , DoctorModel? doctor) => InkWell(
    onTap: (){
      Get.to( DoctorProfile( doctor: doctor,),);
    },
    highlightColor: grey,
    child: Container(
      padding: const EdgeInsets.all(14.0),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color:white,
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
                      color:grey, )
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}