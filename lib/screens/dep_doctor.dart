import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rama/screens/Doctor_profile.dart';
import '../controller/dep_doc_con.dart';
import '../model/department_model.dart';
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
        title: defaultTitle(
          text: '${department!.speciality}',
          fontSize: 20.0,
          color1: defaultGreen,
          color2: defaultGreen3,
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
              child: loadingCircle(color: defaultGreen),
            );
          }
          else if (docController.docList.isEmpty) {
            return const Center(
              child: Text('No doctor yet'),
            );
          }
            return defaultPull(
              function: handleRefresh,
              list: ListView.separated(
                itemBuilder: (context, index) => doctorItem(
                  doctor: docController.docList[index],
                  function:   (){
                    Get.to( DoctorProfile( doctor: docController.docList[index],),);
                  },
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 12.0,),
                itemCount: docController.docList.length,
              ),
            );
        }
        ),
      ),
    );
  }
}