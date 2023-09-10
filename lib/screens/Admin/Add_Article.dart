import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama/shared/components/components.dart';
import 'dart:io';
import '../../Network/DataBaseHelper.dart';
import '../../controller/Article_controller.dart';
import '../../shared/components/constants.dart';
import '../../shared/local/cache_helper.dart';


class AddArticle extends StatelessWidget {

  ArticleController articleController= Get.put(ArticleController());
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String  token = CacheHelper.getData(key: "token");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Green1,Green2],).createShader(rect),
          child:  Text("Add Article",
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
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children:  [
                const SizedBox(height: 10.0,),
            Obx( ()=>
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      width: 250,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child:
                      articleController.imagePath.value==''?
                      const Image( image:
                      NetworkImage('https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                        fit: BoxFit.cover,)
                          : Image.file(File(articleController.imagePath.value),fit: BoxFit.cover,),
                    ),
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: indigoAccent,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined,size: 20.0,),
                        onPressed: articleController.pickImage,
                      ),
                    ),
                  ],
                ),
            ),

                const SizedBox(height: 40.0,),

                defaultTextForm(
                  controller:titleController,
                  type: TextInputType.text,
                  label: 'Article Title',
                  labelStyle: const TextStyle(color: indigoAccent,),
                  prefix: const Icon(Icons.article_outlined,
                    color: indigoAccent,),
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter article title ' ;
                    }
                    return null;
                  },
                  enableBorder: const UnderlineInputBorder(
                    borderSide:  BorderSide(color: indigoAccent,),
                  ),
                  focusedBorder:const UnderlineInputBorder(
                    borderSide:  BorderSide(color: blueAccent,),
                  ),
                ),

                const SizedBox(height: 30.0,),

                defaultTextForm(
                  maxLines: null,
                  controller:descriptionController,
                  type: TextInputType.text,
                  hint: 'Enter Article Description...',
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Please enter article description' ;
                    }
                    return null;
                  },
                  border: InputBorder.none,
                ),
                const SizedBox(height: 30.0,),

                defaultBottom(
                  text: 'Add' ,
                  width: 100.0,
                  height: 40.0,
                  background: indigoAccent,
                  function: (){
                    if(formkey.currentState!.validate()){
                      DataBaseHelper.AddArticle(
                        token: token.toString(),
                        title: titleController.text,
                          image: File(articleController.imagePath.value),
                          description: descriptionController.text,
                      );
                      Get.back();
                    }
                  },
                ),
                const SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}