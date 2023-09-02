import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../Network/DataBaseHelper.dart';
import '../../shared/components/constants.dart';

class PatientHomeController extends GetxController {

  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index ;
  }
  var fbm = FirebaseMessaging.instance;

  @override
  void onInit() {
    fbm.getToken().then((token) {
      print('===token====');
      print(token);
      print('===token====');
    });
    FirebaseMessaging.onMessage.listen((event) {
      print('==== data notification ====');
      print("${event.notification}");
      print('==== notification body ====');
      print("${event.notification!.body}");
      print('==== notification title ====');
      print("${event.notification!.title}");
      print('==== data notification ====');
    });
    super.onInit();
  }

  @override
  void onReady() async{
    await DataBaseHelper.getMe(
      token: token.toString(),
    );
    super.onReady();

  }

}