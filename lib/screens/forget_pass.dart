import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/passVer.dart';
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
                  Center(
                    child: Hero(
                      tag: "logo2",
                      child: Image.asset(
                        'assets/images/logo2.png',
                        width: 170,
                        height: 100,
                        fit:  BoxFit.fitWidth,
                      ),
                    ),
                  ),
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
                        const SizedBox(height: 30.0,),
                        ShaderMask(
                          shaderCallback: (rect) => const LinearGradient(
                            colors: [defaultGreen,defaultGreen3],).createShader(rect),
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
                                height: 35,
                              ),
                        const  Text(
                                'Enter your email',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: black54,
                                ),
                          maxLines: 2,
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
                                        Get.to(() => forget_pass_ver());
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
                                        fontSize: 14.0,
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
