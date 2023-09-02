import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/Article_controller.dart';
import '../model/Article_model.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class ArticleDetail extends StatelessWidget {
  final ArticleModel? article;
   ArticleDetail({Key? key , required this.article}) : super(key: key);
  ArticleController articleController= Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
    child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(image:NetworkImage('${article?.image}',
    ),
    alignment: Alignment.topCenter,
    fit: BoxFit.fitWidth,
    ),
    gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [orange1,orange2],
    ),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    backCircle(),
    SizedBox(height: MediaQuery.of(context).size.height*0.5,),
    Container(
    width: double.infinity,
    decoration: const BoxDecoration(
    color: white,
    borderRadius:  BorderRadius.vertical(top: Radius.circular(50)),
    ),
    child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    const SizedBox(height: 10.0,),
    Text('${article?.title}',
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style:const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,)
    ,),
    const SizedBox(height: 30.0,),
    Text(' ${article?.description} ',
                      maxLines: null,
                      style:const TextStyle(
                        fontSize: 14.0,
                        color:grey, )
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
}
