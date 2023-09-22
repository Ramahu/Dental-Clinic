import 'dart:io';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../model/Article_model.dart';
import '../../model/appotmentmodel.dart';
import '../../model/doctor_model.dart';
import '../../model/patient_model.dart';
import 'constants.dart';

Widget defaultLogo() => Center(
child: Hero(
tag: "logo2",
child: Image.asset(
'assets/images/logo2.png',
width: 150,
height: 150,
fit:  BoxFit.fitWidth,
),
),
);

Widget defaultTitle({
  required String text,
  required double fontSize,
  required Color color1,
  required Color color2,
}) => ShaderMask(
shaderCallback: (rect) =>  LinearGradient(
colors: [color1,color2],).createShader(rect),
child:  Text(text,
style:  GoogleFonts.dancingScript(
textStyle:  TextStyle(
fontSize: fontSize,
fontWeight: FontWeight.bold,
color: white,
),
),
),
);


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
    style: const TextStyle(color: white,
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
        icon: Icon(suffix, color: defaultGreen,),
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


Widget defaultDropdownDate({
  required int? endYear,
  required void Function(String?)? onChangedDay,
  required void Function(String?)? onChangedMonth,
  required void Function(String?)? onChangedYear,
  InputBorder? border,
  InputBorder? focusedBorder,
  InputBorder? enableBorder,
})=> Padding(
padding: const EdgeInsets.all(20.0),
child: DropdownDatePicker(
inputDecoration: InputDecoration(
enabledBorder: enableBorder,
focusedBorder: focusedBorder,
border: border,
),
isDropdownHideUnderline: true,
isFormValidator: true,
startYear: 1900,
endYear: endYear,
width: 10,
onChangedDay: onChangedDay,
onChangedMonth: onChangedMonth,
onChangedYear: onChangedYear,
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
    backgroundColor: indigoAccent,
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
            child: const Text('NO', style: TextStyle(color: red,
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

Widget defaultPull({
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
      width: 250,
      height: 200,
      fit: BoxFit.fitWidth,
    ),
    const SizedBox(height: 30.0,),
    Text(title,
      style: GoogleFonts.abel(
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: black54,
        ),
      ),),
    const SizedBox(height: 25.0,),
    Text(about,
      maxLines: null,
      style: GoogleFonts.abel(
        textStyle: const TextStyle(
          fontSize: 18.0,
          color: black54,
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

Widget loadingCircle({
required Color color,
}) => SpinKitFadingCircle(
itemBuilder: (BuildContext context, int index) {
return DecoratedBox(
decoration: BoxDecoration(
color: color,
borderRadius: BorderRadiusDirectional.circular(10.0),
),
);
},
);

Widget doctorItem({
  required DoctorModel ? doctor,
  required function,
}) => InkWell(
  onTap: function,
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
            child:Hero(
              tag: 'doctor ${doctor?.doctorId}',
              child: Image( image:
              NetworkImage(
                // '${doctor?.image}'
                  'https://www.nicepng.com/png/detail/7-74994_free-png-doctor-png-images-transparent-doctor-images.png'
              ),
                fit: BoxFit.cover,),
            )
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

Widget patientItem({
  required PatientModel? patient,
  required  function,
}) => InkWell(
  onTap: function,
  highlightColor: grey,
  child: Container(
    padding: const EdgeInsets.all(14.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(200),
      color: white,
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 5,
          color: grey,
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${patient?.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
      ],
    ),
  ),
);

Widget appointmentItem({
  required AppointmentModel ? appointment,
  bool isDoctor = false,
  bool isPatient = false,
}) => Container(
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text(
                  isPatient ?
                  'Dr.${appointment!.doctorName}'
                  :  '${appointment!.patientName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,)
                  ,),
                Text('Date : ${appointment.appDate}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                    fontSize: 14.0,
                    color:grey,
                  )
                  ,),
                const SizedBox(height: 3.0,),
                Text( 'Time : ${appointment.appTime}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 14.0,
                      color:grey, )
                ),
                isPatient ?
                Text('speciality : ${appointment.departmentName}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 14.0,
                      color:grey, )
                )
                : const SizedBox(height: 1.0,),
              ],
            ),
          ),
        ],
      ),
    );
