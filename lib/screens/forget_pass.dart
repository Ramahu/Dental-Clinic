import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Patient/forgotpasswordverification_patient.dart';
import '../Network/DataBaseHelper.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import 'Signin.dart';

class forget_pass extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/dentalogo.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 90,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      ShaderMask(
                        shaderCallback: (rect) => const LinearGradient(
                          colors: [Green1,Green2],).createShader(rect),
                        child:  Text('Forgot Password ?',
                          style:  GoogleFonts.dancingScript(
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                              height: 10,
                            ),
                      const  Text(
                              'Enter the email address associated with your account.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black54,
                              ),
                            ),
                      const  SizedBox(
                              height: 10,
                            ),
                      const  Text(
                              'We will email you a verification code to check your authenticity.',
                              style: TextStyle(
                                color: black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      const  SizedBox(height: 20.0),
                      defaultTextForm(
                        controller: email,
                        type: TextInputType.emailAddress,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        autofillHints: [AutofillHints.email],
                        label: 'Email Address',
                        labelStyle: const TextStyle(color: grey,),
                        prefix: const Icon(Icons.mail_outline_outlined,
                          color: defaultGreen,),
                        validate: (value){
                          if(value!.isEmpty){
                            return 'Please enter email address' ;
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
                                  text: 'Send' ,
                                  width:  MediaQuery.of(context).size.width * 0.8,
                                  height: 50.0,
                                  color1:  Green1,
                                  color2: Green2,
                                  function: () async{
                                    if(formKey.currentState!.validate()) {
                                      DataBaseHelper.repassData(
                                        email: email.text,
                                      );

                                      Get.to(() => forgotpasswordverification_patient());
                                    }
                                  }
                              ),
                            ),
                      const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Remember your password? ',
                                  style:  GoogleFonts.abel(
                                    textStyle: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){Get.to(SigninScreeen() ); },
                                  child: Text('Sign in',
                                    style:  GoogleFonts.abel(
                                      textStyle: const TextStyle(
                                        fontSize: 18.0,
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

    );
  }
}
