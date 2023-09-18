import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/diagnosis_controller.dart';
import '../../model/diagnosis_model.dart';
import '../../shared/components/constants.dart';

class diagnosisdetails extends StatelessWidget {

  DiagnosisModel? diagnosis;
  diagnosisdetails({Key? key,  required this.diagnosis}) : super(key: key);
  DiagnosisController diagnosisController = Get.put(DiagnosisController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
                iconTheme:const IconThemeData(size: null,
              color: defaultGreen,),
                title: ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [Green1,Green2],).createShader(rect),
                  child:  Text( "Diagnosis Details".tr,
                    style:  GoogleFonts.dancingScript(
                      textStyle: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                backgroundColor:white,
              ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              Text('Dr name:  ${diagnosis?.doctorName} ',
                  style:const TextStyle(
                    fontSize: 14.0,
                    color:grey, )
              ),
              const SizedBox(height: 20.0,),
              Text('Patient name :  ${diagnosis?.patientName} ',
                  style:const TextStyle(
                    fontSize: 14.0,
                    color:grey, )
              ),
              const SizedBox(height: 20.0,),
              Text('Price :  ${diagnosis?.price} ',
                  style:const TextStyle(
                    fontSize: 14.0,
                    color:grey, )
              ),
              const SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color:grey, )
                  ),
                    const SizedBox(height: 8.0,),
                    Text(' ${diagnosis?.description} ',
                        maxLines: null,
                        style:const TextStyle(
                          fontSize: 14.0,
                          color:grey, )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }
}




