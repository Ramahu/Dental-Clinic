import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Doctor/AddDiagnosis.dart';
import 'package:rama/screens/Doctor/DiagnosisDetails.dart';
import '../../controller/diagnosis_controller.dart';
import '../../model/diagnosis_model.dart';
import '../../model/patient_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class alldiagnoses extends StatelessWidget {

  final PatientModel? patient;
  alldiagnoses({Key? key,  required this.patient}) : super(key: key);
  DiagnosisController diagnosisController = Get.put(DiagnosisController());


  Future<void> handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    patientId=patient!.patientId!;

    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(size: null,
          color: defaultGreen,),
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text( "All Diagnosis".tr,
            style:  GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
        ),
        backgroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (diagnosisController.isLoading.isTrue) {
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
          else if (diagnosisController.diagnosisList.isEmpty) {
            Center(
              child: Text('Np diagnosis yet'.tr,
                 ),
            );
          }
          return defaultPull(
            function: handleRefresh,
            list: ListView.separated(
              itemBuilder: (context, index) =>
                  buildDiaItem(
                      context, diagnosisController.diagnosisList[index]),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 12.0,),
              itemCount: diagnosisController.diagnosisList.length,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddDiagnosis(patient:patient));
        },

        highlightElevation: 70,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildDiaItem(BuildContext context, DiagnosisModel? diagnosis) => InkWell(
      onTap: () {
        Get.to(diagnosisdetails(diagnosis:diagnosis));
      },
      highlightColor: grey,
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 5,
              color: grey,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price : ${diagnosis?.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: grey,
                      )),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text('${diagnosis?.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),

          ],
        ),
      ),
  );
}
