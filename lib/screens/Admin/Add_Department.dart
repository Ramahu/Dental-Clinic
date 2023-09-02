import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/shared/components/components.dart';
import '../../Network/DataBaseHelper.dart';
import '../../controller/department_controller.dart';
import '../../shared/components/constants.dart';


class AddDepartment extends StatelessWidget {

  DepartmentController departmentController= Get.put(DepartmentController());
  var specialityController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text("Add Department",
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
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 40.0,),

                  defaultTextForm(
                    controller:specialityController,
                    type: TextInputType.name,
                    label: 'Department Name',
                    labelStyle: const TextStyle(color: indigoAccent,
                      fontSize: 13.0,),
                    prefix: const Icon(Icons.category_outlined,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter department name ' ;
                      }
                      return null;
                    },
                    enableBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: indigoAccent,),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide:  BorderSide(color: blueAccent,),
                    ),
                  ),

                const SizedBox(height: 40.0,),
            Obx( ()=>
                Row(
                  children: [
                    TextButton.icon(onPressed: (){
                      departmentController.chooseOpenTime();
                    },
                        icon: const Icon(Icons.access_time_outlined,
                        color: indigoAccent,),
                        label:const Text('Choose Open Time: ' ,
                          style: TextStyle(color: indigoAccent,fontSize: 11.0,),
                        ),
                    ),
                    Text("${departmentController.selectedOpenTime.value.hour}:"
                        "${departmentController.selectedOpenTime.value.minute}, ",
                      style: const TextStyle(color: black54,fontSize: 11.0,),),
                  ],
                ),
            ),

                const SizedBox(height: 40.0,),
          Obx( ()=>
           Row(
              children: [
                TextButton.icon(onPressed: (){
                  departmentController.chooseCloseTime();
                },
                  icon: const Icon(Icons.access_time_outlined,
                    color: indigoAccent,),
                  label:const Text('Choose Close Time:',
                      style: TextStyle(color: indigoAccent,fontSize: 11.0,),
                  ),
                ),
                Text("${departmentController.selectedCloseTime.value.hour}:"
                    "${departmentController.selectedCloseTime.value.minute}, ",
                  style: const TextStyle(color: black54,fontSize: 11.0,),),
              ],
           ),
          ),

                const SizedBox(height: 40.0,),

                defaultBottom(
                  text: 'Add' ,
                  width: 100.0,
                  height: 40.0,
                  background: indigoAccent,
                  function: (){
                    if(formkey.currentState!.validate()){
                      DataBaseHelper.AddDepartment(
                        //token: token,
                          speciality: specialityController.text,
                          openTime: departmentController.selectedOpenTime.value,
                          closeTime: departmentController.selectedCloseTime.value,
                      );
                      Get.back();
                    }
                  },
                ),
                const SizedBox(height: 40.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}