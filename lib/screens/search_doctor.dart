import 'package:flutter/material.dart';
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
                  color: white,
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
                      child: loadingCircle(color: defaultGreen),
                    );
                  }
                  if(searchList.isNotEmpty) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => doctorItem(
                        doctor:  searchList[index],
                        function:   (){
                          Get.to( DoctorProfile( doctor:  searchList[index],),);
                        },
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
}


