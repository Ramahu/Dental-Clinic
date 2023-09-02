import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../../controller/controller.dart';
import '../../controller/doctor/doctor_Appointment_Controller.dart';
import '../../controller/patient_controller.dart';
import '../../locale/locale_controller.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/drawer_list_tile.dart';
import '../Signin.dart';


class HomeDoctor extends StatelessWidget {

  PatientController patientController = Get.put(PatientController());
  DoctorAppointmentController appointmentController = Get.put(DoctorAppointmentController());
  Controller controller= Get.put(Controller());
  MyLocalController conrollerlang = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        colors: [Green1,Green2],).createShader(rect),
      child:  Text('Smile',
        style:  GoogleFonts.dancingScript(
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: grey,
          ),
        ),
      ),
    ),
    backgroundColor: white,
    iconTheme:  const IconThemeData(color: grey),
    actions: [
    // IconButton(onPressed: (){},
    // icon: const Icon(Icons.search,),
    // ),
    ],
    ),
      key: controller.scaffoldKey,
      drawer: Drawer(
        backgroundColor: white,
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "assets/images/logowithtext.png",
              ),
            ),
            DrawerListTile(
                title: 'mpr'.tr, svgSrc: 'assets/icons/pr1.svg', tap: () {

                }),
            ExpansionTile(
              title: Text("chl".tr,
                  style: const TextStyle(color: grey, fontFamily: 'NanumMyeongjo')),
              leading: SvgPicture.asset(
                'assets/icons/lan.svg',
                color: grey,
                height: 20,
              ),
              children: [
                ListTile(
                  title: const Text("English",
                      style: TextStyle(fontFamily: 'NanumMyeongjo')),
                  onTap: () {
                    conrollerlang.changeLang("en");
                  },
                ),
                ListTile(
                    title: const Text("العربية",
                        style: TextStyle(fontFamily: 'NanumMyeongjo')),
                    onTap: () {
                      conrollerlang.changeLang("ar");
                    })
              ],
            ),
            DrawerListTile(
                title: 'dar'.tr, svgSrc: 'assets/icons/-moon.svg', tap: () {

            }),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: appPadding * 2),
              child: Divider(
                color: grey,
                thickness: 0.2,
              ),
            ),
            DrawerListTile(
                title: 'lo'.tr,
                svgSrc: 'assets/icons/Logout.svg',
                tap: () {
                  Get.offAll(SigninScreeen());
                }),
          ],
        ),
      ),
     body: SingleChildScrollView(
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
    );
  }
}