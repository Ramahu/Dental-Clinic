import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Network/DataBaseHelper.dart';
import '../model/diagnosis_model.dart';
import '../shared/components/constants.dart';

class DiagnosisController extends GetxController {
//doctor
  List<DiagnosisModel> diagnosisList =[];
  var isLoading = true.obs;
  var selectedapptime = DateTime.now().obs;
  var appodate = DateTime.now().obs;


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
    diagnosisList = await DataBaseHelper.getDiagnosis(
    token: token.toString(),
    userId:userId,
      patientId: patientId,
    );
    isLoading(false);
    super.onReady();
  }

  chooseapptime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
        helpText: "Sel_App_Tim".tr);
    if (pickedTime != null ) {
      selectedapptime.value = DateFormat.jm().parse( pickedTime.format(Get.context!).toString());
    }
  }


  choosedisDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: appodate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Sel_App_Dat'.tr,
        cancelText: 'close'.tr,
        confirmText: 'confirm'.tr,
        errorFormatText: 'En_Va_Dat'.tr,
        errorInvalidText: 'En_Va_Dat_Ra'.tr,
        fieldHintText: 'year/month/day'.tr,
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != appodate.value) {
      appodate.value = pickedDate;
    }
  }
  bool disableDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5)))) {
      return true;
    }
    return false;
  }

}
