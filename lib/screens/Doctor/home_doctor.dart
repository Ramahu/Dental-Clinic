import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../../controller/controller.dart';
import '../../controller/doctor/doctor_Appointment_Controller.dart';
import '../../controller/patient_controller.dart';
import '../../locale/locale_controller.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../Signin.dart';


class HomeDoctor extends StatelessWidget {

  PatientController patientController = Get.put(PatientController());
  DoctorAppointmentController appointmentController = Get.put(DoctorAppointmentController());
  Controller controller= Get.put(Controller());
  MyLocalController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  SliderDrawer(
    slideDirection:  controllerLang.initialLang.toString() == 'ar'
    ? SlideDirection.RIGHT_TO_LEFT
        : SlideDirection.LEFT_TO_RIGHT,
    key: controller.sliderDrawerKey,
    sliderOpenSize: 190,
    appBar: SliderAppBar(
    appBarColor: white,
    isTitleCenter: false,
    appBarPadding: const EdgeInsets.all(10),
    title:defaultTitle(
      text: '    Smile',
      fontSize: 22.0,
      color1: Green1,
      color2: Green2,
    ),
    drawerIconColor: grey,
    trailing:
    IconButton(onPressed: (){
    //Get.to(searchDoctor());
    },
    icon: const Icon(Icons.search,
    color:defaultGreen,),
    ),
    ),
    slider: Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Green1,Green2],
    ),
    ),
    child:SafeArea(
    child: ListTileTheme(
    textColor: white,
    iconColor: white,
    minLeadingWidth: 0.1,
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [
    const SizedBox(
    height: 60.0,
    ),
    Row(
    children: [
    Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(170.0),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: const Image(
    image: NetworkImage(
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
    ),
    ),
    const SizedBox(
    width: 8.0,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
      'hi'.tr,
    style: GoogleFonts.signikaNegative(
    textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: white,
    ),
    ),
    ),
    Text('name',
    style: GoogleFonts.signikaNegative(
    textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: white,
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    const SizedBox(
    height: 30.0,
    ),
    ExpansionTile(
    title: Text("chl".tr,
    style: const TextStyle(color: white)),
    leading:  const Icon(Icons.language),
    children: [
    ListTile(
    title: const Text("English",),
    onTap: () {
    controllerLang.changeLang("en");
    controller.closeDrawer();
    },
    ),
    ListTile(
    title: const Text("العربية",),
    onTap: () {
    controllerLang.changeLang("ar");
    controller.closeDrawer();
    })
    ],
    ),
    ListTile(
    onTap: () { controller.closeDrawer();},
    leading: const Icon(Icons.nights_stay),
    title:  Text('dark'.tr),
    ),
    ListTile(
    onTap: () { controller.closeDrawer();},
    leading: const Icon(Icons.notifications_active),
    title:  Text('not'.tr),
    ),
    ListTile(
    onTap: () {
    // CacheHelper.remove(key: 'token');
    Get.offAll(SigninScreeen());
    },
    leading: const Icon(Icons.logout),
    title:  Text('logout'.tr),
    ),
    ],
    ),
    ),
    ),
    ),
    child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40.0,),
         Text( 'Welcome Doctor ',
          maxLines: 2,
          style: GoogleFonts.dosis(
            textStyle: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: black54,
            ),
          ),
        ),
        const SizedBox(height: 30.0,),
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 8,
            lightSource: LightSource.topLeft,
            color: white,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 4.0,),
                Text('The number of your patients = ${patientController.patientList.length.toString()} ',
                  maxLines: 2,
                  style: GoogleFonts.dosis(
                      textStyle: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: black54,)
                  ),
                  ),
                const SizedBox(height: 4.0,),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0,),
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 8,
            lightSource: LightSource.topLeft,
            color: white,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 4.0,),
                Text('The number of your appointments = ${appointmentController.AppointmentList.length.toString()} ',
                  maxLines: 2,
                  style: GoogleFonts.dosis(
                    textStyle:const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: black54,)
                  ),),
                const SizedBox(height: 4.0,),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30.0,),
        ],
      ),
    ),
     ),
     ),
    );
  }
}