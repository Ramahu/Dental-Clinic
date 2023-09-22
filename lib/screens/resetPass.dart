import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Network/DataBaseHelper.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';


class reset_pass extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
        Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Green1,Green2],
            ),
            borderRadius:  BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backCircle(),
                defaultLogo(),
              ],
            ),
          ),
        ),
      ),
    AnimatedPositioned(
    top: 200,
    left: 20,
    duration:Duration(milliseconds: 700),
    curve: Curves.bounceInOut,
    child: AnimatedContainer(
    duration: Duration(milliseconds: 700),
    curve: Curves.bounceInOut,
    height: 450 ,
    width: MediaQuery.of(context).size.width - 40,
    decoration: BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 15,
    spreadRadius: 5),
    ],
    ),
    child:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0,),
                defaultTitle(
                  text: 'Reset password',
                  fontSize: 30.0,
                  color1: defaultGreen,
                  color2: defaultGreen3,
                ),
                const SizedBox(
                  height: 35,
                ),
                const  Text(
                  'Enter new password',
                  style: TextStyle(
                    fontSize: 18,
                    color: black54,
                  ),
                ),
                const  SizedBox(
                  height: 20,
                ),
                defaultTextForm(
                  controller:passwordController,
                  type: TextInputType.visiblePassword,
                  label: 'Password',
                  labelStyle: const TextStyle(color: grey,),
                  maxLines: 1,
                  prefix: const Icon(Icons.key_outlined,
                    color: defaultGreen,),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter password' ;
                    }
                    if(value.length<8){
                      return 'Short password' ;
                    }
                    return null;
                  },
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color:defaultGreen,),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color: defaultGreen,),
                  ),
                  enableBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color: defaultGreen,),
                  ),
                ),
                const SizedBox(height: 20.0,),
                defaultTextForm(
                  controller:confirmPassController,
                  type: TextInputType.visiblePassword,
                  label: 'Confirm Pass',
                  labelStyle: const TextStyle(color: grey,),
                  maxLines: 1,
                  prefix: const Icon(Icons.key_outlined,
                    color: defaultGreen,),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter confirm password' ;
                    }
                    if(passwordController.value.text != value){
                      return 'Mast match' ;
                    }
                    return null;
                  },
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color:defaultGreen,),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color: defaultGreen,),
                  ),
                  enableBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:  BorderSide(color: defaultGreen,),
                  ),
                ),
                const  SizedBox(height: 30.0),
                Center(
                  child: defaultGradientBottom(
                      text: 'reset' ,
                      width:  MediaQuery.of(context).size.width * 0.8,
                      height: 50.0,
                      color1: Green1,
                      color2: Green2,
                      function: () async{
                        if(formKey.currentState!.validate()) {
                          DataBaseHelper.newPass(
                              passwordController.text,
                            confirmPassController.text
                          );
                          //Get.to(() => SigninScreeen());
                        }
                      }
                  ),
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    ),
    ),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            child:  Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
              ],
            ),),
        ],
      ),
    );
  }
}

