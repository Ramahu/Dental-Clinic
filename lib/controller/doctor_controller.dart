import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rama/model/doctor_model.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../Network/DataBaseHelper.dart';
import '../shared/components/constants.dart';
import '../shared/local/cache_helper.dart';

class DoctorController extends GetxController {

  List<DoctorModel> DoctorList =[];
  var isLoading = true.obs;
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;
  String? _imagePath;
  String? get imagePath => _imagePath;
   final imagePicker= ImagePicker();
   var rating = 0.0.obs;
  // final doctor = <DoctorModel>[].obs;
  // List<DoctorModel> get doctorList => doctor.value;
  //  var imagePath=''.obs;
  // PickedFile? pickedFile = ''.obs as PickedFile?;
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
     DoctorList = await DataBaseHelper.getDoctors(
       token: token.toString(),
     );
     isLoading(false);
     super.onReady();

   }


   // void addDoctor(DoctorModel doctorModel){
   //   doctor.add( doctorModel);
   // }

   // void removeDoctor(DoctorModel doctorModel){
   //   doctor.remove(doctorModel);
   // }


   Future<void> pickImage() async {
     _pickedFile = await imagePicker.getImage(source: ImageSource.gallery) ;
     update();
   }


  showRatingDialog(){
     Get.dialog(Padding(
       padding: const EdgeInsets.all(10.0),
       child: RatingDialog(
         starColor: Colors.yellow,
           title: const Text(' Rating Dialog ',
           textAlign: TextAlign.center,),
           message: const Text(' Add rating to the doctor , Tap a star to set your rating. ' ,
               style: TextStyle(
                 fontSize: 16.0,
                 color:Colors.grey, )
           ),
           submitButtonText: 'Submit',
           onSubmitted: (response){
           rating.value = response.rating;
           },
         submitButtonTextStyle: const TextStyle(
           color:Colors.indigoAccent,
           fontSize: 18.0,) ,
           enableComment: false,
       ),
     ),
     );
   }

}
