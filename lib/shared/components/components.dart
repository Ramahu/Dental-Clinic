import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'constants.dart';


Widget defaultBottom({
  required double width,
  required double height,
  required Color background,
  required String text,
  required function ,
  double radius = 15.0,
}) => Container(
   alignment: Alignment.center,
  width: width,
  height: height,
  child: MaterialButton(
    onPressed: function,
    child: Text(text,
    style: const TextStyle(color: Colors.white,
    fontSize: 16.0)
    ),
  ),
   decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
  color: background,
    boxShadow: const [
      BoxShadow(
        offset: Offset(0,2),
        blurRadius: 5,
       // color: Colors.grey,
      ),
    ],
 ),
);

Widget defaultGradientBottom({
  required double width,
  required double height,
  required Color color1,
  required Color color2,
  required String text,
  required function,
  double radius = 35.0,
}) =>
    Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: transparent,
          disabledForegroundColor: transparent,
          shadowColor: transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: function,
        child: Text(text, style: const TextStyle(color: white, fontSize: 18.0)),
      ),
    );


Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
   String? label,
  TextStyle? labelStyle,
  InputBorder? border,
   InputBorder? focusedBorder,
   InputBorder? enableBorder,
  Icon? prefix ,
  IconData? suffix ,
  ValueChanged<String>? onSubmit,
  FormFieldValidator<String>? validate,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  String? hint,
  int? maxLines,
  AutovalidateMode? autoValidateMode,
  Iterable<String> ? autofillHints,
   suffixPressed ,
}) => Padding(
  padding: const EdgeInsets.only(left: 10.0,right: 10.0 ),
  child:   TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    obscureText: isPassword,
    onChanged: onChange,
    onFieldSubmitted: onSubmit,
    maxLines: maxLines,
    autovalidateMode: autoValidateMode,
    enableSuggestions: true,
    autofillHints: autofillHints,
    decoration: InputDecoration(
      hintText: hint,
      labelText: label,
      labelStyle: labelStyle,
      prefixIcon: prefix,
      suffixIcon: IconButton(
        icon: Icon(suffix, color: const Color(0xFF96D9DC),),
        onPressed: suffixPressed,),
      enabledBorder:enableBorder,
  focusedBorder: focusedBorder,
      border: border,
    ),
  ),
);


Widget defaultDropdown({
  required List<DropdownMenuItem<String>> items,
  FormFieldValidator<String>? validate,
  AutovalidateMode? autoValidateMode,
   onChange,
  Widget? hint,
  InputBorder? border,
  InputBorder? focusedBorder,
  InputBorder? enableBorder,
  Key? key,
  Icon? prefix,
})=> Padding(
padding: const EdgeInsets.only(left: 23.0, right: 23.0),
child:   DropdownButtonFormField(
items : items,
  onChanged:onChange,
validator: validate,
autovalidateMode: autoValidateMode,
hint: hint,
  isDense:true,
key: key,
decoration: InputDecoration(
  prefixIcon: prefix,
border: border,
  enabledBorder:enableBorder,
  focusedBorder: focusedBorder,
),
),
);


Widget defaultImagePicker({
   File? image ,
  required function ,
}
) => Stack(
  alignment: AlignmentDirectional.bottomEnd,
  children: [
  Container(
    width: 170,
    height: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(170.0),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:
    image!= null?
    Image.file(image)
        :
   // Image.file(File('https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png')),
    const Image( image:
    NetworkImage('https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
    ),
  ),
  CircleAvatar(
    radius: 18.0,
    backgroundColor: Colors.indigoAccent,
    child: IconButton(
      icon: const Icon(Icons.camera_alt_outlined,size: 20.0,),
      onPressed: function,
),
),
],
);

 defaultAlert({
  required BuildContext context,
   required function,
})=>showDialog(context: context,
    builder: (context) {
      return  AlertDialog(
        title: const Text('Delete',
          textAlign: TextAlign.center,),
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight:FontWeight.bold,
        ),
        content:const Text('Do you want to delete ?',
          textAlign: TextAlign.center,),
        actions: [
          TextButton(
            onPressed: (){Get.back();},
            child: const Text('NO', style: TextStyle(color: Colors.red,
              fontWeight:FontWeight.bold,),),
          ),
          TextButton(
            onPressed:function,
            child: const Text('Yes',style: TextStyle(color: Colors.green,
              fontWeight:FontWeight.bold,),),
          ),
        ],
      );
    },
  );

 defaultPull({
   required function,
   required ListView list,
}) => LiquidPullToRefresh(
onRefresh: function,
backgroundColor: const Color(0xFFFF9785),
color: white,
height: 80,
borderWidth: 3.0,
animSpeedFactor: 2,
showChildOpacityTransition: false,
   child: list,
);

onBoarding({
  required String url,
  required String title,
  required String about,
required double width,
  required double height,
}) => Container(
color: white,
width: width,
height: height,
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(height: 50.0,),
    Image.asset(
      url,
      width: 260,
      height: 190,
    ),
    const SizedBox(height: 30.0,),
    Text(title,
      style: GoogleFonts.abel(
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),),
    const SizedBox(height: 20.0,),
    Text(about,
      maxLines: null,
      style: GoogleFonts.abel(
        textStyle: const TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
        ),
      ),
    ),
    const SizedBox(height: 20.0,),
  ],
),
);

Widget backCircle() => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    width: 35.0,
    height: 35.0,
    decoration: const BoxDecoration(
      color: white,
      shape: BoxShape.circle,
    ),
    child: ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        colors: [defaultGreen3,defaultGreen ],
      ).createShader(rect),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: grey,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    ),
  ),
);
