import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Network/DataBaseHelper.dart';
import '../../controller/diagnosis_controller.dart';
import '../../model/patient_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';

class AddDiagnosis extends StatelessWidget {

  final PatientModel? patient;
  AddDiagnosis({Key? key,  required this.patient}) : super(key: key);
  DiagnosisController diagnosisController = Get.put(DiagnosisController());
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  String  token = CacheHelper.getData(key: "token");


  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: null,
          color:defaultGreen,),
        title: defaultTitle(
          text:"Add Diagnosis ".tr,
          fontSize: 20.0,
          color1: Green1,
          color2: Green2,
        ),
        backgroundColor: white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  maxLines: null,
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter description'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'description'.tr,
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                        )),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  maxLines: 1,
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter price'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'price'.tr,
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultBottom(
                  text: 'Add'.tr,
                  width: 100.0,
                  height: 40.0,
                  background: indigoAccent,
                  function: () {
                    if (formkey.currentState!.validate()) {
                      DataBaseHelper.AddDiagnosis(
                          token: token.toString(),
                          doctorId: userId.toString(),
                          patientId: patient!.patientId!.toString(),
                        doctorName: userName,
                        patientName: patient!.name!,
                        price: priceController.text,
                        diagnosis: descriptionController.text,

                      );
                      Get.back();
                    }
                  },

                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
