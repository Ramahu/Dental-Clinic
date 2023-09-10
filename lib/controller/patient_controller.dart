import 'package:get/get.dart';

import '../Network/DataBaseHelper.dart';
import '../model/patient_model.dart';
import '../shared/components/constants.dart';
import '../shared/local/cache_helper.dart';

class PatientController extends GetxController {


  List<PatientModel> patientList =[];
  var isLoading = true.obs;
  String  token = CacheHelper.getData(key: "token");

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
