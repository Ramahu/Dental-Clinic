import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rama/screens/search_doctor.dart';
import '../../controller/Article_controller.dart';
import '../../controller/controller.dart';
import '../../controller/department_controller.dart';
import '../../controller/doctor_controller.dart';
import '../../locale/locale_controller.dart';
import '../../model/BarChart_model.dart';
import '../../model/PieChart_model.dart';
import '../../shared/components/constants.dart';
import '../Signin.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeAdmin extends StatelessWidget {

  DepartmentController departmentController= Get.put(DepartmentController());
  ArticleController articleController= Get.put(ArticleController());
  DoctorController doctorController= Get.put(DoctorController());
  Controller controller= Get.put(Controller());
  MyLocalController controllerLang = Get.find();



  List<PieChartSectionData> getSections() =>
      data.asMap().map<int ,PieChartSectionData >((index , data){
        final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent}%',
          titleStyle: const TextStyle(
            color: white ,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),

        );
        return MapEntry(index, value) ;
      }).values.toList();

  @override
  Widget build(BuildContext context) {


    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "percent",
        data: chartModel,
        domainFn: (BarChartModel series, _ )=> series.doctorName,
        measureFn: (BarChartModel series, _ )=> series.percent,
        colorFn: (BarChartModel series, _ )=> series.color,
      ),
    ];


    return Scaffold(
    body: SliderDrawer(
    slideDirection:  controllerLang.initialLang.toString() == 'ar'
    ? SlideDirection.RIGHT_TO_LEFT
        : SlideDirection.LEFT_TO_RIGHT,
    key: controller.sliderDrawerKey,
    sliderOpenSize: 190,
    appBar: SliderAppBar(
    appBarColor: white,
    isTitleCenter: false,
    appBarPadding: const EdgeInsets.all(10),
    title: ShaderMask(
    shaderCallback: (rect) => const LinearGradient(
    colors: [Green1,Green2],).createShader(rect),
    child:  Text('    Smile',
    style:  GoogleFonts.dancingScript(
    textStyle: const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: white,
    ),
    ),
    ),
    ),
    drawerIconColor: grey,
    trailing:
    IconButton(onPressed: (){
    Get.to(searchDoctor());
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
      ListTile(
        onTap: () { controller.closeDrawer();},
        leading: const Icon(Icons.nights_stay),
        title:  Text('dark'.tr),
      ),
      ListTile(
        onTap: () { controller.closeDrawer();},
        leading: const Icon(Icons.nights_stay),
        title:  Text('dark'.tr),
      ),
      ListTile(
        onTap: () { controller.closeDrawer();},
        leading: const Icon(Icons.nights_stay),
        title:  Text('dark'.tr),
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
    child:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   const SizedBox(height: 30.0,),
                    Text(' Welcome Admin ',
                     maxLines: 2,
                     style: GoogleFonts.dosis(
                       textStyle: const TextStyle(
                       fontSize: 40.0,
                       fontWeight: FontWeight.bold,
                       color: black54,
                       ),
                     ),),
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
                            Text('The number of doctors in the clinic = ${doctorController.DoctorList.length.toString()} ',
                             maxLines: 2,
                             style:  GoogleFonts.dosis(
                               textStyle: const TextStyle(
                               fontSize: 12.0,
                               fontWeight: FontWeight.bold,
                               color: black54,),
                             ),),
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
                                Text('The number of departments in the clinic = ${departmentController.DepartmentList.length.toString()} ',
                                 maxLines: 2,
                                 style:  GoogleFonts.dosis(
                                   textStyle: const TextStyle(
                                   fontSize: 12.0,
                                   fontWeight: FontWeight.bold,
                                   color: black54,),
                                 ),),
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
                            Text('The number of articles in the clinic = ${articleController.ArticleList.length.toString()} ',
                             maxLines: 2,
                             style:  GoogleFonts.dosis(
                               textStyle: const TextStyle(
                               fontSize: 12.0,
                               fontWeight: FontWeight.bold,
                               color: black54,),
                             ),),
                           const SizedBox(height: 4.0,),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(height: 20.0,),
                    Text("Departments profits",
                     style:  GoogleFonts.dosis(
                       textStyle:const TextStyle(
                       color: black54 ,
                       fontWeight: FontWeight.bold,
                       fontSize: 18.0,),
                     ),),
                   const SizedBox(height: 8.0,),
               Neumorphic(
                 style: NeumorphicStyle(
                   shape: NeumorphicShape.concave,
                   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                   depth: 8,
                   lightSource: LightSource.topLeft,
                   color: white,
                 ),
                 child: Container(
                   width:  MediaQuery.of(context).size.width,
                   height:  MediaQuery.of(context).size.height/2,
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         width: 200,
                         height: 200,
                         // width:  MediaQuery.of(context).size.width,
                         // height:  MediaQuery.of(context).size.height/2,
                         child: PieChart(
                           PieChartData(
                             sections: getSections(),
                             sectionsSpace: 5,
                             centerSpaceRadius: 30,
                           ),
                         ),
                 ),
                            Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children:data.map((data) => buildPieItem(
                                       color: data.color,
                                       departmentName: data.departmentName,
                                     )
                                       ).toList(),
                                   ),
                                ),
                              ],
                             ),
                     ],
                   ),
                 ),
               ),

                   const SizedBox(height: 20.0,),
                    Text("Doctors profits",
                     style:  GoogleFonts.dosis(
                       textStyle:const TextStyle(
                       color: black54 ,
                       fontWeight: FontWeight.bold,
                       fontSize: 18.0,
                       ),),),
                   const SizedBox(height: 8.0,),
                   Neumorphic(
                     style: NeumorphicStyle(
                       shape: NeumorphicShape.concave,
                       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                       depth: 8,
                       lightSource: LightSource.topLeft,
                       color: white,
                     ),
                     child: Container(
                       width:  MediaQuery.of(context).size.width,
                       height:  MediaQuery.of(context).size.height/2,
                       child: Column(
                         children: [
                           Container(
                             padding: const EdgeInsets.all(10.0),
                             width:  MediaQuery.of(context).size.width,
                             height:  MediaQuery.of(context).size.height/2,
                             child:charts.BarChart(
                               series,
                               animate: true,
                             ),
                           ),
                           Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Column(
                                   //mainAxisAlignment: MainAxisAlignment.center,
                                   children: chartModel.map((chartModel) => buildBarItem(
                                     color: chartModel.color as Color,
                                     doctorName: chartModel.doctorName,
                                   )
                                   ).toList(),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),


  ],
      ),
             ),
           ),
    ),
    );
  }

  Widget buildPieItem({
  required Color color,
    required String departmentName,
    double size = 16,
})=>  Row(
children: [
Container(
  height: size,
width: size,
decoration: BoxDecoration(
shape: BoxShape.circle,
  color: color,
),
),
  const SizedBox(width: 5.0,),
  Text(departmentName,
    style:const TextStyle(
      color: black54,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),),
],
);
  Widget buildBarItem({
    required Color color ,
    required String doctorName,
    double size = 16,
  })=>  Row(
    children: [
      Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  color,
        ),
      ),
      const SizedBox(width: 5.0,),
      Text(doctorName,
        style:const TextStyle(
          color: black54,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),),
    ],
  );
}