import 'package:get/get.dart';
import '../../Network/DataBaseHelper.dart';
import '../../shared/components/constants.dart';

class DoctorHomeController extends GetxController {

  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index ;
  }
  @override
  void onReady() async{
    await DataBaseHelper.getMe(
      token: token,
    );
    super.onReady();

  }
}