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
  // List<DoctorModel> DoctorList = [
  //   DoctorModel(
  //     doctorId: 1,
  //     departmentId: 0,
  //     name: "Rama Hamad",
  //     description: "Rama is a doctor specializing in dental orthodontics.",
  //     speciality: "Orthodontics",
  //     phone: "09887644442",
  //     image: 'https://img.freepik.com/premium-psd/female-doctor-isolated-transparent-background_879541-1281.jpg?w=360',
  //   ),
  //   DoctorModel(
  //     doctorId: 2,
  //     departmentId: 1,
  //     name: "Ahmed Saleh",
  //     description: "Ahmed is an experienced dentist with a focus on oral surgery.",
  //     speciality: "Oral Surgery",
  //     phone: "09876543211",
  //     image: 'https://image.similarpng.com/very-thumbnail/2020/05/Male-young-doctor-transparent-PNG.png',
  //   ),
  //   DoctorModel(
  //     doctorId: 3,
  //     departmentId: 2,
  //     name: "Lina Kareem",
  //     description: "Lina specializes in pediatric dentistry, caring for children’s dental health.",
  //     speciality: "Pediatric Dentistry",
  //     phone: "09881234567",
  //     image: 'https://img.freepik.com/premium-psd/female-doctor-png-isolated-transparent-background_645927-13964.jpg?w=740',
  //   ),
  // ];

  var isLoading = true.obs;
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;
  String? _imagePath;
  String? get imagePath => _imagePath;
   final imagePicker= ImagePicker();
   var rating = 0.0.obs;
  final doctor = <DoctorModel>[].obs;
  List<DoctorModel> get doctorList => doctor.value;
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
     Get.dialog( RatingDialog(
         starColor: yellow,
           title: const Text(' Rating Dialog ',
           textAlign: TextAlign.center,),
           message: const Text(' Add rating to the doctor , Tap on a star to set your rating. ' ,
               style: TextStyle(
                 fontSize: 15.0,
                 color: grey, ),
             textAlign: TextAlign.center,
           ),
           image: Image.asset(
             'assets/images/logo2.png',
             width: 100,
             height: 110,
             fit:  BoxFit.fitWidth,
           ),
           submitButtonText: 'Submit',
           onSubmitted: (response){
           rating.value = response.rating;
           },
         submitButtonTextStyle: const TextStyle(
           color:indigoAccent,
           fontSize: 18.0,) ,
           enableComment: false,
       ),
     );
   }

}
