import 'package:get/get.dart';
import '../../Network/DataBaseHelper.dart';
import '../../shared/local/cache_helper.dart';

class AdminHomeController extends GetxController {

  var tabIndex = 0.obs;
  String token = CacheHelper.getData(key: "token");

  void changeTabIndex(int index){
    tabIndex.value = index ;
  }
  @override
  void onReady() async{
    await DataBaseHelper.getMe(
      token: token.toString(),
    );
    super.onReady();

  }
}