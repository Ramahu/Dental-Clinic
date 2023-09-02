import 'package:get/get.dart';
import '../Network/DataBaseHelper.dart';
import '../model/doctor_model.dart';
import '../shared/components/constants.dart';

class DepDocController extends GetxController {

  List<DoctorModel> docList = [];
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
    docList= await DataBaseHelper.getDepDoctors(
      departmentId: departmentId,
     // token: token.toString(),
    );
    isLoading(false);
    super.onReady();
  }

}