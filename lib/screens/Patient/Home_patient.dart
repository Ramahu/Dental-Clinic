import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../../controller/Article_controller.dart';
import '../../controller/controller.dart';
import '../../controller/department_controller.dart';
import '../../controller/doctor_controller.dart';
import '../../locale/locale_controller.dart';
import '../../model/Article_model.dart';
import '../../model/department_model.dart';
import '../../model/doctor_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/drawer_list_tile.dart';
import '../Doctor_profile.dart';
import '../Signin.dart';
import '../article_detail.dart';
import '../dep_doctor.dart';
import '../search_doctor.dart';


class PatientHome extends StatelessWidget {

  Controller controller= Get.put(Controller());
  MyLocalController conrollerlang = Get.find();
  DepartmentController departmentController= Get.put(DepartmentController());
  ArticleController articleController= Get.put(ArticleController());
  DoctorController doctorController= Get.put(DoctorController());

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
    IconButton(onPressed: (){
      Get.to(searchDoctor());
    },
    icon: const Icon(Icons.search,
    color:defaultGreen,),
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
                'assets/images/dentalogo.png',
              ),
            ),
            DrawerListTile(
                title: 'mpr'.tr, svgSrc: 'assets/icons/pr1.svg', tap: () {}),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0,),
          CarouselSlider(items: const [
            Image(image:  NetworkImage('https://st2.depositphotos.com/6222352/10768/v/950/depositphotos_107686026-stock-illustration-tooth-with-dental-care-word.jpg'),
                 fit: BoxFit.cover,
            width: double.infinity,),
            Image(image:  NetworkImage('https://st2.depositphotos.com/6222352/10749/v/950/depositphotos_107494408-stock-illustration-tooth-with-family-holding-billboards.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,),
            Image(image:  NetworkImage('https://st3.depositphotos.com/6222352/12769/v/950/depositphotos_127695768-stock-illustration-we-are-a-team.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,),
            Image(image:  NetworkImage('https://st2.depositphotos.com/6222352/10740/v/950/depositphotos_107404038-stock-illustration-cartoon-tooth-holding-billboards.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,),
            Image(image:  NetworkImage('https://st2.depositphotos.com/6222352/11236/v/950/depositphotos_112369876-stock-illustration-i-love-my-dentist.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,),
          ],
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
          ),
          const SizedBox(height: 24.0,),
          const Padding(
            padding:  EdgeInsets.all(15.0),
            child:  Text(" Departments ",
              style: TextStyle(
                color: black54 ,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
          ),
          const SizedBox(height: 8.0,),
          Container(
            padding:  const EdgeInsets.only(left: 7.0, right: 7.0),
            height: 100,
            child: Obx( () {
              if (departmentController.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: defaultGreen,
                    strokeWidth: 5,
                  ),
                );
              }
              else if (departmentController.DepartmentList.isEmpty) {
                return const Center(
                  child: Text('No department yet'),
                );
              }
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  buildDepartment(departmentController.DepartmentList[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 7.0,),
              itemCount: departmentController.DepartmentList.length,
            );
            }),
          ),
          const SizedBox(height: 10.0,),
          const Padding(
            padding:  EdgeInsets.all(15.0),
            child:  Text(" Article ",
              style: TextStyle(
                color: black54 ,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
          ),
          const SizedBox(height: 8.0,),
             Container(
               padding:  const EdgeInsets.only(left: 7.0, right: 7.0),
               height: 100,
               child: Obx( () {
                 if (articleController.isLoading.isTrue) {
                   return const Center(
                     child: CircularProgressIndicator(
                       color: defaultGreen,
                       strokeWidth: 5,
                     ),
                   );
                 }
                 else if (articleController.ArticleList.isEmpty){
                   const Center( child: Text('No article yet'),);
                 }
              return ListView.separated(
                 physics: const BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildArticle(articleController.ArticleList[index]),
                separatorBuilder: (context, index) => const SizedBox(width: 7.0,),
                itemCount: articleController.ArticleList.length,
          );
               }),
             ),
          const SizedBox(height: 10.0,),
          const Padding(
            padding:  EdgeInsets.all(15.0),
            child:  Text("All Doctors ",
              style: TextStyle(
                color: black54 ,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
          ),
         const SizedBox(height: 8.0,),
          Container(
            padding:  const EdgeInsets.only(left: 7.0, right: 7.0),
            child:  Obx( () {
              if (doctorController.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: defaultGreen,
                    strokeWidth: 5,
                  ),
                );
              }
              else if(doctorController.DoctorList.isEmpty)
              {
                return const Center(
                  child: Text('No doctor yet'),
                );
              }
              return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>  buildDocItem(context,
                doctorController.DoctorList[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
              itemCount:doctorController.DoctorList.length,
            );
            }),
          ),
          const SizedBox(height: 40.0,),
        ],
      ),
    ),
    );
  }
  buildDepartment(DepartmentModel? department) => InkWell(
  onTap: (){
    Get.to( DepDoc( department: department,),);
  },
  highlightColor: grey,
    child: Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        depth: 8,
        lightSource: LightSource.topLeft,
        color: white,
      ),
  child: Container(
    padding: const EdgeInsets.all(8.0),
 height: 80,
      width: 110,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const SizedBox(height: 5.0,),
    Text('${department?.speciality}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      color: black54,)
      ,),
        const SizedBox(height: 5.0,),
    ],
  ),
    ),
    ),
  );

  buildArticle(ArticleModel? article) => InkWell(
    onTap: (){
      Get.to( ArticleDetail( article: article,),);
    },
    highlightColor:grey,
       child: Neumorphic(
  style: NeumorphicStyle(
  shape: NeumorphicShape.concave,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
    depth: 8,
    lightSource: LightSource.topLeft,
    color: white ,
  ),
  child: Container(
    padding: const EdgeInsets.all(8.0),
        height: 100,
        width: 250,
          child: Row(
            children: [
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children:[ Text('${article?.title}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      color: black54 ,)
                      ,),
    ],
              ),
            ),
              const SizedBox(width: 9.0,),
              Container(
                width: 110,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                ),
                child: Image( image : NetworkImage('${article?.image}'),fit: BoxFit.cover,),
              ),
              const SizedBox(width: 5.0,),
            ],
          ),
    ),
       ),
  );

  Widget buildDocItem(BuildContext context , DoctorModel ? doctor) =>
      InkWell(
        onTap: (){
          Get.to( DoctorProfile( doctor: doctor,),);
        },
        highlightColor: grey,
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0,2),
                blurRadius: 5,
                color: grey,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 10.0,),
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(60.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Image( image:
                  NetworkImage('${doctor?.image}'),
                    fit: BoxFit.cover,)
              ),

              const SizedBox(width: 15.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('${doctor!.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,)
                      ,),
                    const SizedBox(height: 3.0,),
                    Text('speciality : ${doctor.speciality}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          fontSize: 14.0,
                          color: grey, )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}