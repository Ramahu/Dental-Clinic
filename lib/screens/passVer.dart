import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/resetPass.dart';
import '../Network/DataBaseHelper.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';


class forget_pass_ver extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
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
    height: 400 ,
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0,),
                  defaultTitle(
                    text: 'Verification',
                    fontSize: 30.0,
                    color1: defaultGreen,
                    color2: defaultGreen3,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const  Text(
                    'Enter the verification code we just sent on your email address.',
                    style: TextStyle(
                      fontSize: 16,
                      color: black54,
                    ),
                  ),
                  const  SizedBox(height: 20.0),
                  defaultTextForm(
                    controller: code,
                    type: TextInputType.number,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    autofillHints: [AutofillHints.oneTimeCode],
                    label: 'Ver code',
                    labelStyle: const TextStyle(color: grey,),
                    prefix: const Icon(Icons.mail_outline_outlined,
                      color: defaultGreen,),
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Please enter the code' ;
                      }
                      if (value.length < 6) {
                        return 'too short';
                     }
                     if (value.length > 6) {
                     return 'check your code and try again';
                     }
                      return null;
                    },
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:  BorderSide(color: defaultGreen,),
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
                  const  SizedBox(height: 20.0),
                  Center(
                    child: defaultGradientBottom(
                        text: 'Verify' ,
                        width:  MediaQuery.of(context).size.width * 0.8,
                        height: 50.0,
                        color1: Green1,
                        color2: Green2,
                        function: () async{
                          if(formKey.currentState!.validate()) {
                        DataBaseHelper.repassVer(
                        code.text
                        );
                        Get.to(reset_pass());
                          }
                        }
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('If you didn\'t receive a code ! ',
                        style:  GoogleFonts.abel(
                          textStyle: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){ },
                        child: Text('Resend',
                          style:  GoogleFonts.abel(
                            textStyle: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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

