import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Network/DataBaseHelper.dart';
import '../model/department_model.dart';
import '../shared/components/constants.dart';
import '../shared/local/cache_helper.dart';

class DepartmentController extends GetxController {

  List<DepartmentModel> DepartmentList =[];
  var isLoading = true.obs;

  var selectedOpenTime = DateTime.now().obs;
  var selectedCloseTime = DateTime.now().obs;
  //String  token = CacheHelper.getData(key: "token");


  chooseOpenTime() async{
    TimeOfDay? pickedTime = await showTimePicker(context: Get.context!,
        initialTime:TimeOfDay.now() ,
        helpText: 'Select Department Open Time ');
    if(pickedTime !=null ){
      selectedOpenTime.value=DateFormat.jm().parse( pickedTime.format(Get.context!).toString());
    }
  }
  chooseCloseTime() async{
    TimeOfDay? pickedTime = await showTimePicker(context: Get.context!,
        initialTime:TimeOfDay.now() ,
        helpText: 'Select Department Close Time ',
    );
    if(pickedTime!=null ){
      selectedCloseTime.value=DateFormat.jm().parse( pickedTime.format(Get.context!).toString());
    }
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
    selectedOpenTime.close();
    selectedCloseTime.close();
  }
  @override
  void onReady() async{
    //DataBaseHelper.token
    // DepartmentList= await DataBaseHelper.getDepartments(
    //   token: token.toString(),
    // );
    isLoading(false);
    super.onReady();
  }


}
