import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../controller/Article_controller.dart';
import '../../model/Article_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'Add_Article.dart';

class ClinicArticle extends StatelessWidget{

  ArticleController articleController= Get.put(ArticleController());

  Future<void> handleRefresh() async{
    return await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  defaultTitle(
          text:"All Article",
          fontSize: 20.0,
          color1: Green1,
          color2: Green2,
        ),
        backgroundColor: white ,
        iconTheme:  const IconThemeData(color: grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child : Obx( () {
          if (articleController.isLoading.isTrue) {
            return  Center(
              child: loadingCircle(color: defaultGreen),
            );
          }
          else if (articleController.ArticleList.isEmpty){
          const Center( child: Text('No article yet'),);
          }
          return defaultPull(
          function: handleRefresh,
          list: ListView.separated(
          itemBuilder: (context, index) => buildArtItem(context,articleController.ArticleList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 12.0,),
          itemCount: articleController.ArticleList.length,
          )
          ,
          );
        }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Get.to(  AddArticle(),); },
        backgroundColor: defaultGreen ,
        highlightElevation: 70,
        child: const Icon(FluentIcons.document_one_page_add_16_regular ,size: 30),
      ),
    );
  }
  Widget buildArtItem(BuildContext context , ArticleModel? article) =>
      Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion (),
          children: [
            SlidableAction(
              onPressed:(context){
                defaultAlert(context:context,
                    function:(){
                      //articleController.removeArticle(article!);
                      Get.back();
                    }
                );
              },
              backgroundColor: redAccent,
              foregroundColor: white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: (){},
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
                  width: 70,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                  ),
                  child: Image( image:
                  NetworkImage('${article?.image}'),
                    fit: BoxFit.cover,),
                ),

                const SizedBox(width: 15.0,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('${article?.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,)
                        ,),
                      const SizedBox(height: 3.0,),
                      Text('${article?.description}',
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
        ),
      );
}