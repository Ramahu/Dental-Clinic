import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/shared/components/components.dart';
import 'dart:io';
import '../../Network/DataBaseHelper.dart';
import '../../controller/doctor_controller.dart';
import '../../shared/components/constants.dart';


class  AddDoctor extends StatelessWidget {

  //DoctorController doctorController=Get.put(DoctorController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var specialityController = TextEditingController();
  var descriptionController = TextEditingController();
  //var phoneController = TextEditingController();
  var depIdController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>DoctorController());
    return Scaffold(
      appBar: AppBar(
        title:  ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text("Add Doctor",
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
      body:  GetBuilder<DoctorController>(builder:(DoctorController){
        return Padding(padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  const SizedBox(height: 10.0,),

                  //Obx( ()=>
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(170.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child:
                          DoctorController.pickedFile != null ?
                          Image.file(File(DoctorController.pickedFile!.path),fit: BoxFit.cover,)
                              : const Image( image:
                          NetworkImage('https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                            fit: BoxFit.cover,)
                      ),
                      CircleAvatar(
                        radius: 18.0,
                        backgroundColor: indigoAccent,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined,size: 20.0,),
                          onPressed: DoctorController.pickImage,
                        ),
                      ),
                    ],
                  ),
                  // ),

                  const SizedBox(height: 40.0,),

                  defaultTextForm(
                    controller:nameController,
                    type: TextInputType.name,
                    label: 'Doctor Name',
                    labelStyle: const TextStyle(color: indigoAccent,),
                    prefix: const Icon(Icons.person_outline,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter doctor name' ;
                      }
                      return null;
                    },
                    enableBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: blueAccent,),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide:  BorderSide(color: blueAccent,),
                    ),
                  ),
                  const SizedBox(height: 30.0,),

                  defaultTextForm(
                    controller:specialityController,
                    type: TextInputType.text,
                    label: 'Doctor Speciality',
                    labelStyle: const TextStyle(color: indigoAccent,),
                    prefix: const Icon(Icons.category_outlined,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter doctor speciality' ;
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


                  const SizedBox(height: 30.0,),

                  defaultTextForm(
                    controller:emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email Address',
                    labelStyle: const TextStyle(color:indigoAccent,),
                    prefix: const Icon(Icons.mail_outline_outlined,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter email address' ;
                      }
                      if(value.contains('@')==false||value.contains('.com')==false){
                        return 'Invalid email' ;
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
                  const SizedBox(height: 30.0,),

                  defaultTextForm(
                    controller:passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    labelStyle: const TextStyle(color: indigoAccent,),
                    prefix: const Icon(Icons.key_outlined,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter password' ;
                      }
                      if(value.length<8){
                        return 'Short password' ;
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
                  const SizedBox(height: 30.0,),

                  defaultTextForm(
                    controller:depIdController,
                    type: TextInputType.number,
                    label: 'Department id ',
                    labelStyle: const TextStyle(color: indigoAccent,),
                    prefix: const Icon(Icons.looks_one_outlined,
                      color: indigoAccent,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter department id ' ;
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
                  const SizedBox(height: 30.0,),

                  defaultTextForm(
                    maxLines: null,
                    controller:descriptionController,
                    type: TextInputType.text,
                    hint: 'Enter  Description...',
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter  description' ;
                      }
                      return null;
                    },
                    border: InputBorder.none,
                  ),

                  const SizedBox(height: 40.0,),

                  defaultBottom(
                    text: 'Add' ,
                    width: 90.0,
                    height: 40.0,
                    background: indigoAccent,
                    function: (){
                      if(formkey.currentState!.validate()){
                        DataBaseHelper.AddDoctor(
                          token:token.toString(),
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          image:File(DoctorController.pickedFile!.path),
                          speciality: specialityController.text,
                          departmentId: depIdController.text,
                          description: descriptionController.text,
                        );
                        Get.back();
                      }
                    },
                  ),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}