import 'package:get/get.dart';
import '../Network/DataBaseHelper.dart';
import '../model/doctor_model.dart';
import '../screens/search_doctor.dart';

class searchDocController extends GetxController {

  List<DoctorModel> searchList = [];
  var isLoading = true.obs;
  searchDoctor? search;
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
   searchList= await DataBaseHelper.getSearch(text: search!.searchController.text);
    isLoading(false);
    super.onReady();
  }

}