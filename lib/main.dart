import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rama/model/doctor_model.dart';
import 'package:rama/screens/Admin/home_admin.dart';
import 'package:rama/screens/Doctor/doctor_layout.dart';
import 'package:rama/screens/Patient/Patient_layout.dart';
import 'package:rama/screens/Signin.dart';
import 'package:rama/screens/onboarding.dart';
import 'package:rama/shared/components/constants.dart';
import 'package:rama/shared/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future backgroundMessage(RemoteMessage message)async{
  print('==== background Message ====');
  print("${message.notification!.body}");
}
SharedPreferences? sharepref;


void main() async {
   //WidgetsFlutterBinding.ensureInitialized();
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundMessage);

   await CacheHelper.init();



  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  //late Widget widget;
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    MyLocalController controller = Get.put(MyLocalController());

    DoctorModel doctor = DoctorModel(doctorId: 1, departmentId: 1,
        name: "Rama Alhussin", description:'rama is a doctor for dental ....',
      speciality: 'dental' , phone: '09887644442' ,
      //image:
    );


    // if(token != null)
    // {
    //   if(isAdmin.isTrue)
    //   {
    //     widget= HomeAdmin();
    //   }
    //   else if (isDoctor.isTrue)
    //   {
    //     widget=DoctorLayout();
    //   }
    //   else if (isPatient.isTrue)
    //   {
    //     widget=PatientLayout();
    //   }
    // }
    // else{
    //   widget= Splash();
    // }

    return GetMaterialApp(
      title: 'dental clinic',
      locale: controller.initialLang,
      translations: MyLocale(),
      debugShowCheckedModeBanner: false,
      home: onboarding(),



    );
  }
}
