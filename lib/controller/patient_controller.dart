import 'package:get/get.dart';

import '../Network/DataBaseHelper.dart';
import '../model/patient_model.dart';
import '../shared/components/constants.dart';

class PatientController extends GetxController {


  List<PatientModel> patientList =[];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() async{
    patientList = await DataBaseHelper.getPatients(
      token: token.toString(),
      userId:userId.toString(),
    );
    isLoading(false);
    super.onReady();

  }

}
