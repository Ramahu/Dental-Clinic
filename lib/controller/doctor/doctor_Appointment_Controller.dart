import 'package:get/get.dart';
import '../../Network/DataBaseHelper.dart';
import '../../model/appotmentmodel.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';

class DoctorAppointmentController extends GetxController {

  List<AppointmentModel> AppointmentList =[];
  var isLoading = true.obs;
  String  token = CacheHelper.getData(key: "token");

  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    super.dispose();
  }
  @override
  void onReady() async{
    AppointmentList = await DataBaseHelper.getDoctorAppointment(
      token: token.toString(),
      userId:userId,
    );
    isLoading(false);
    super.onReady();

  }
}