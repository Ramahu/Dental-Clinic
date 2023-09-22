import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../Doctor_profile.dart';
import '../Signin.dart';
import '../article_detail.dart';
import '../dep_doctor.dart';
import '../search_doctor.dart';


class PatientHome extends StatelessWidget {

  Controller controller= Get.put(Controller());
  MyLocalController controllerLang = Get.find();
  DepartmentController departmentController= Get.put(DepartmentController());
  ArticleController articleController= Get.put(ArticleController());
  DoctorController doctorController= Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        slideDirection:  controllerLang.lang == 'ar'
            ? SlideDirection.RIGHT_TO_LEFT
            : SlideDirection.LEFT_TO_RIGHT,
        key: controller.sliderDrawerKey,
        sliderOpenSize: 270,
        appBar: SliderAppBar(
          appBarHeight: 90,
          appBarColor: white,
          isTitleCenter: false,
          appBarPadding: const EdgeInsets.only(top: 30,bottom: 10),
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
             Padding(
              padding: const EdgeInsets.all(15.0),
              child:  Text("dep".tr,
                style: const TextStyle(
                  color: black54 ,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
            ),
            const SizedBox(height: 8.0,),
            Container(
              padding:  const EdgeInsets.only(left: 7.0, right: 7.0),
              height: 50,
              child: Obx( () {
                if (departmentController.isLoading.isTrue) {
                  return  Center(
                    child:  SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color:   defaultGreen,
                            borderRadius: BorderRadiusDirectional.circular(10.0),
                          ),
                        );
                      },
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
                itemBuilder: (context, index) =>  buildDepartment(departmentController.DepartmentList[index],
                    departmentController.DepartmentList[index].id),
                separatorBuilder: (context, index) => const SizedBox(width: 7.0,),
                itemCount: departmentController.DepartmentList.length,
              );
              }),
            ),
            const SizedBox(height: 20.0,),
             Padding(
              padding: const EdgeInsets.all(15.0),
              child:  Text("art".tr,
                style: const TextStyle(
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
                     return  Center(
                       child: SpinKitFadingCircle(
                         itemBuilder: (BuildContext context, int index) {
                           return DecoratedBox(
                             decoration: BoxDecoration(
                               color:   defaultGreen,
                               borderRadius: BorderRadiusDirectional.circular(10.0),
                             ),
                           );
                         },
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
            const SizedBox(height: 20.0,),
             Padding(
              padding: const EdgeInsets.all(15.0),
              child:  Text("dr".tr,
                style: const TextStyle(
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
                  return  Center(
                    child:  SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color:   defaultGreen,
                            borderRadius: BorderRadiusDirectional.circular(10.0),
                          ),
                        );
                      },
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
                itemBuilder: (context, index) =>  doctorItem(
                  doctor: doctorController.DoctorList[index],
                  function:   (){
                    Get.to( DoctorProfile( doctor: doctorController.DoctorList[index],),);
                  },
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
      ),
    );
  }

  buildDepartment(DepartmentModel? department , int? index ) => InkWell(
  onTap: (){
    Get.to( DepDoc( department: department,),);
  },
  highlightColor: grey,
    child: Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
        depth: 8,
        lightSource: LightSource.topLeft,
       // color: index!.isEven ? orange1 : blueAccent,
      ),
  child: Container(
    padding: const EdgeInsets.all(8.0),
    height: 50,
    width: 110,
    decoration:  BoxDecoration(
      gradient:  LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: index!.isEven ?  [redAccent,red2] : [indigoAccent,indigo2],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const SizedBox(height: 5.0,),
    Text('${department?.speciality}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      color: white,)
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


}