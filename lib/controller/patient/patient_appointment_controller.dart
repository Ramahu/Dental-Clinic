import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Network/DataBaseHelper.dart';
import '../../model/appotmentmodel.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';

class PatientAppointmentController extends GetxController {

  List<AppointmentModel> appointmentList =[];
  var isLoading = true.obs;
  var appTime = DateTime.now().obs;
  var appDate = DateTime.now().obs;
 // String  token = CacheHelper.getData(key: "token");


  chooseAppointmentTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
        helpText: 'Select appointment time ');
    if (pickedTime != null) {
      appTime.value =DateFormat.jm().parse( pickedTime.format(Get.context!).toString());
    }
  }

  chooseAppointmentDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: appDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select appointment date',
        cancelText: 'close',
        confirmText: 'confirm',
        errorFormatText: 'enter valid date',
        errorInvalidText: 'enter valid date range',
        fieldHintText: 'month/date/year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != appDate.value) {
      appDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5)))) {
      return true;
    }
    return false;
  }

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
    // appointmentList = await DataBaseHelper.getPatientAppointment(
    //     token: token.toString(),
    //     userId:userId.toString(),
    // );
    isLoading(false);
    super.onReady();

  }
}
