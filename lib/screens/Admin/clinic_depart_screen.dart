import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/department_controller.dart';
import '../../model/department_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'Add_Department.dart';

class ClinicDep extends StatelessWidget{

  DepartmentController departmentController= Get.put(DepartmentController());

  Future<void> handleRefresh() async{
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:   ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text("All Department",
            style:  GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
          backgroundColor: Colors.white ,
          iconTheme:  const IconThemeData(color: grey),
        ),
    body: Padding(
    padding: const EdgeInsets.all(20.0),
    child :
    Obx( () {
      if (departmentController.isLoading.isTrue) {
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
      else if (departmentController.DepartmentList.isEmpty) {
        return const Center(
          child: Text('No department yet'),
        );
      }
      return defaultPull(
        function: handleRefresh,
        list: ListView.separated(
          itemBuilder: (context, index) =>
              buildDepItem(context, departmentController.DepartmentList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
          itemCount: departmentController.DepartmentList.length,
        ),
      );
    }
    ),
    ),
  floatingActionButton: FloatingActionButton(
  onPressed: (){ Get.to(  AddDepartment(),); },
  backgroundColor: defaultGreen ,
  highlightElevation: 70,
  child: const Icon(Icons.playlist_add_sharp),
  ),
  );
}
  Widget buildDepItem(BuildContext context , DepartmentModel? department) =>
      Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.50,
          motion: const StretchMotion (),
          children: [
            SlidableAction(
              onPressed:(context){
                defaultAlert(context:context,
                    function:(){
                     // departmentController.removeDepartment(department!);
                      Get.back();
                    }
                );
              },
              backgroundColor: grey,
              foregroundColor: white,
              icon: Icons.archive,
              label: 'Archive',
            ),
          ],
        ),
        child: InkWell(
          onTap: (){},
          highlightColor: grey,
            child: Container(
              // height: 100,
              // width: 200,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('${department?.speciality}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,)
                          ,),
                        const SizedBox(height: 3.0,),
                            Text('Open time: ${department?.openTime}',
                                style:const TextStyle(
                                  fontSize: 10.0,
                                  color: grey, )
                            ),
                            Text('Close time: ${department?.closeTime}',
                                style:const TextStyle(
                                  fontSize: 10.0,
                                  color: grey, )
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15.0,),
                ],
              ),
        ),
        ),
      );
}