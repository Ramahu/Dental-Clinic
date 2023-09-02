import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Signup.dart';
import '../Network/DataBaseHelper.dart';
import '../controller/login_controller.dart';
import 'package:rama/shared/components/components.dart';
import '../shared/components/constants.dart';
import 'Admin/admin_layout.dart';
import 'Doctor/doctor_layout.dart';
import 'Patient/Patient_layout.dart';

class SigninScreeen extends StatelessWidget{

  List<String> options = ['Admin','Doctor','Patient'];
  SigninController loginController = Get.put(SigninController());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0,),
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
                   child:  Text('Sign In',
                    style:  GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             color: grey,
                           ),
                    ),
                ),
                 ),
                const SizedBox(height: 20.0,),

                defaultDropdown(
                    items: options.map(buildMenuItem).toList(),
                  onChange:  (value){
                    loginController.selectedOption.value=value.toString();
                    print(loginController.selectedOption.value);
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose an item';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  hint: const Text('Select type',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                  prefix: const Icon(
                    Icons.person_2_outlined,
                    color: defaultGreen,
                  ),
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
                const SizedBox(height: 25.0,),

                defaultTextForm(
                  controller:emailController,
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
                const SizedBox(height: 20.0,),

                //Obx( ()=>
                    defaultTextForm(
                  controller:passwordController,
                  type: TextInputType.visiblePassword,
                  label: 'Password',
                  labelStyle: const TextStyle(color:grey,),
                  prefix: const Icon(Icons.key_outlined,
                    color: defaultGreen,),
                 suffix: Icons.visibility_outlined,
                 //loginController.suffix,
                  suffixPressed:(){
                    loginController.isPassword  = !loginController.isPassword;
                  },
                  //loginController.changeVisibility(),
                  isPassword: loginController.isPassword,
                  maxLines: 1,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  autofillHints: [AutofillHints.password],
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter password' ;
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
                //),
                const SizedBox(height: 30.0,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text('Forgot your password ?',
                //       style:  GoogleFonts.abel(
                //         textStyle: const TextStyle(
                //           fontSize: 17.0,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ),
                //     TextButton(
                //       onPressed: (){},
                //       child: Text('Change',
                //         style:  GoogleFonts.abel(
                //           textStyle: const TextStyle(
                //             fontSize: 17.0,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black54,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20.0,),
                Center(
                  child: defaultGradientBottom(
          text: 'Sign in' ,
          width:  MediaQuery.of(context).size.width * 0.8,
          height: 50.0,
          color1:  Green1,
          color2: Green2,
          function: () async{
          if(formKey.currentState!.validate()) {
          DataBaseHelper.loginData(
          email: emailController.text,
           pass: passwordController.text,
          );
          }
          if( DataBaseHelper.signin!.success = true){
            if(loginController.selectedOption.value == 'Admin') {
              Get.to(AdminLayout());}
            if(loginController.selectedOption.value == 'Doctor') {
              Get.to(DoctorLayout());}
            if(loginController.selectedOption.value == 'Patient') {
              Get.to(PatientLayout());}
          }
          }
                  ),
                ),
                const SizedBox(height: 30.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account ? ',
                    style:  GoogleFonts.abel(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){Get.to(SignupScreeen()); },
                      child: Text('Create',
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
  DropdownMenuItem<String> buildMenuItem(String item) =>DropdownMenuItem(
    value: item,
    child: Text ( item,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
  );

}