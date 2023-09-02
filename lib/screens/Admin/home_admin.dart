import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/drawer_list_tile.dart';
import '../Doctor/doctor_layout.dart';
import '../Patient/Patient_layout.dart';
import '../Signin.dart';
import 'clinic_Article_screen.dart';
import 'clinic_depart_screen.dart';
import 'clinic_doctor_screen.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeAdmin extends StatelessWidget {

  DepartmentController departmentController= Get.put(DepartmentController());
  ArticleController articleController= Get.put(ArticleController());
  DoctorController doctorController= Get.put(DoctorController());
  Controller controller= Get.put(Controller());
  MyLocalController conrollerlang = Get.find();



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
          backgroundColor: white ,
          iconTheme:  const IconThemeData(color: grey),
          actions: [
            IconButton(onPressed: (){
              Get.to(searchDoctor());
            },
              icon: const Icon(Icons.search,),
              ),
            const SizedBox(width: 20.0,),
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
                title: 'mpr'.tr, svgSrc: 'assets/icons/pr1.svg', tap: () {}),
            DrawerListTile(
                title: 'dr'.tr,
                svgSrc: 'assets/icons/pr2.svg',
                tap: () {
                  Get.to(Clinic_Doctors());
                }),
            DrawerListTile(
                title: 'cp'.tr,
                svgSrc: 'assets/icons/part22.svg',
                tap: () {
                  Get.to(ClinicDep());
                }),
            DrawerListTile(
                title: 'art'.tr,
                svgSrc: 'assets/icons/articles.svg',
                tap: () {
                  Get.to(ClinicArticle());
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
                  Get.offAll( SigninScreeen());
                }),
          ],
        ),
      ),
    body:
    SingleChildScrollView(
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