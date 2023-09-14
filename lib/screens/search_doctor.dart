import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/screens/Doctor_profile.dart';
import '../Network/DataBaseHelper.dart';
import '../controller/search_doc_controller.dart';
import '../model/doctor_model.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class searchDoctor extends StatelessWidget{

  var searchController = TextEditingController();
 // searchDocController searchDoc =  Get.put(searchDocController());
  List<DoctorModel> searchList = [];
  var isLoading = true.obs;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [defaultGreen3,defaultGreen ],).createShader(rect),
            child:  Text('Search Doctor',
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
        ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultTextForm(
              controller:searchController,
              type: TextInputType.text,
              label: 'Search ',
              labelStyle: const TextStyle(color: grey,),
               prefix: const Icon(Icons.search,
               color: grey,),
                onSubmit: (String text) async{
                  searchList= await DataBaseHelper.getSearch(text: text);
                  isLoading(false);
                },
                ),
              const SizedBox(height: 20.0,),
              Container(
                padding:  const EdgeInsets.all(20.0),
                child: Obx( () {
                  if (isLoading.isTrue) {
                    return  Center(
                      child: SpinKitFadingCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: defaultGreen,
                              borderRadius: BorderRadiusDirectional.circular(10.0),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if(searchList.isNotEmpty) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildDocItem(context,
                            searchList[index],
                          ),
                      separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0,),
                      itemCount: searchList.length,
                    );
                  }
                  return  Center(
                    child: Image.asset(
                      'assets/images/d1.png',
                    ),
                  );
                  // Center(
                  //   child: Text('No item yet'),
                  // );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                            color:grey, )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      );


}


