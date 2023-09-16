import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Signin.dart';
import '../Network/DataBaseHelper.dart';
import '../controller/login_controller.dart';
import 'package:rama/shared/components/components.dart';
import '../controller/signup_controller.dart';
import '../shared/components/constants.dart';
import '../shared/local/cache_helper.dart';
import 'Patient/Patient_layout.dart';

class SignupScreeen extends StatelessWidget{

  List<String> options = ['Male','Female'];
  SignupController signupController = Get.put(SignupController());
  var formKey = GlobalKey<FormState>();
  var key = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children:[
          Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Green1,Green2],
              ),
              borderRadius:  BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo2.png',
                      width: 150,
                      height: 150,
                      fit:  BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            AnimatedPositioned(
              top: 150,
              left: 20,
              duration:Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.bounceInOut,
                  height: 500 ,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 10.0,),
      Center(
        child: ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
                colors: [defaultGreen,defaultGreen3 ],).createShader(rect),
            child:  Text('Create Account',
                style:  GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: grey,
                  ),
                ),
            ),
        ),
      ),
      const SizedBox(height: 30.0,),
      defaultTextForm(
          controller:nameController,
          type: TextInputType.text,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          label: 'Name',
          labelStyle: const TextStyle(color:grey,),
          prefix: const Icon(Icons.person_outline,
              color: defaultGreen,),
          validate: (value){
              if(value!.isEmpty){
                return 'Please enter your name' ;
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
      defaultTextForm(
          controller:emailController,
          type: TextInputType.emailAddress,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          label: 'Email ',
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
      defaultTextForm(
          controller:phoneController,
          type: TextInputType.number,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          label: 'Phone',
          labelStyle: const TextStyle(color: grey,),
          prefix: const Icon(Icons.phone_android_outlined,
              color: defaultGreen,),
          validate: (value){
              if(value!.isEmpty){
                return 'Please enter phone number' ;
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
      defaultDropdown(
          items: options.map(buildGenderItem).toList(),
          onChange:  (value){
              signupController.selectedOption.value=value.toString();
          },
          validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose an item';
              }
              return null;
          },
          autoValidateMode: AutovalidateMode.onUserInteraction,
          hint: const Text('Gender',
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
      const SizedBox(height: 20.0,),
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
      const SizedBox(height: 30.0,),
      Center(
          child: defaultGradientBottom(
                text: 'Sign Up' ,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50.0,
                color1:  Green1,
                color2: Green2,
                function: () async{
                  if(formKey.currentState!.validate()) {
                    DataBaseHelper.registerData(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      conPass: confirmPassController.text,
                      phone: phoneController.text,
                      gender: signupController.selectedOption.value == "male" ? 0 : 1,
                    );
                    if (DataBaseHelper.signUp!.success == true ){
                      Get.to(PatientLayout());
                      CacheHelper.saveData(key: "token",
                          value: DataBaseHelper.signUp!.token);
                    }
                  }
                }
          ),
      ),
      const SizedBox(height: 30.0,),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('Already have an account ? ',
                style:  GoogleFonts.abel(
                  textStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){Get.to(SigninScreeen());},
                child: Text('Sign In',
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
  DropdownMenuItem<String> buildGenderItem(String item) =>DropdownMenuItem(
    value: item,
    child: Text ( item,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
  );
}