import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:rama/model/doctor_model.dart';
import '../model/Article_model.dart';
import '../model/appotmentmodel.dart';
import '../model/department_model.dart';
import '../model/diagnosis_model.dart';
import '../model/doctor_model.dart';
import '../model/patient_model.dart';
import '../model/usermodel.dart';
import '../screens/Admin/admin_layout.dart';
import '../screens/Admin/forgotpasswordverification_admin.dart';
import '../screens/Admin/reset_newpassAdmin.dart';
import '../screens/Doctor/doctor_layout.dart';
import '../screens/Doctor/forgotpasswordverification_doctor.dart';
import '../screens/Doctor/resetpassdoc.dart';
import '../screens/Patient/Patient_layout.dart';
import '../screens/Patient/forgotpasswordverification_patient.dart';
import '../screens/Patient/resetnewpasspatient.dart';
import '../shared/components/constants.dart';

class DataBaseHelper {
  static final  dio = Dio();
  static String serverUrl = "http://192.168.1.111:8000";
  //var status;
  //static String? token;
  static final time = DateFormat.Hm();
  static final date = DateFormat('yyyy-MM-dd');
  static SignModel? signin;


  static void loginData({
    required String email,
    required String pass,
  }) async {
    String myUrl = "$serverUrl/api/login";
    final response = await http.post(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
        }, body: {
          "email": email,
          "password": pass,
        });
    var data = json.decode(response.body);
    print(data);
    print('================statusCode=================');
    print(response.statusCode);
    print('=================data======================');
    signin = SignModel.fromJson(data);
    print(signin!.message);
    // if (response.statusCode == 200) {
    //   Get.to(AdminLayout());
    // }
    token = data["access_token"];
    //userId = data["id"];

  }

  // static Future signIn({
  //  required String email,
  //   required String password,
  // }) async {
  //   Response? response = await dio.post(
  //     '$serverUrl/api/auth/login',
  //     data:{
  //       'email': email,
  //       'password': password,
  //     },
  //     options: Options(
  //         headers: <String,String>{
  //           'Accept': 'application/json',
  //         }
  //     ),
  //   ).then((value) {
  //     signin = SignModel.fromJson(value.data);
  //     print('========================data======================');
  //     print(value.data);
  //     print('========================data======================');
  //     print(signin!.message);
  //     print('=======================statusCode=================');
  //     print(value.statusCode);
  //     print('=================================================');
  //   }).catchError((error){
  //     print(error.toString());
  //   });
  // }


  static Future AddDoctor({
  required String token,
  required String email,
  required String password,
  required String name,
  required File image,
  required String speciality,
  required String departmentId,
  required String description,
  //required String phone,
}) async {
      FormData fromData = FormData.fromMap({
        'email': email,
        'password': password,
        'name': name,
        'speciality': speciality,
        'department_id':departmentId,
        'desc' : description,
        //'phone':phone,
        'img': await MultipartFile.fromFile(image.path , filename: image.path.split('/').last,),
      });
      Response? response = await dio.post(
      '$serverUrl/api/auth/addDoctor',
      data:fromData,
      options: Options(
        headers: <String,String>{
          'Accept': 'application/json',
          'auth-token': token,
        }
      ),
    ).then((value) {
              print('========================data======================');
              print(value.data);
              print('=======================statusCode=================');
              print(value.statusCode);
              print('=================================================');
        }).catchError((error){
          print(error.toString());
        });
  }

  static Future<List<DoctorModel>> getDoctors({required String token,}) async{
  String myUrl = "$serverUrl/api/showAllDoctor";
  var response = await http.get(Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
        'auth-token': token,
      });
  print('=======================statusCode=================');
  print(response.statusCode);
  print('========================body======================');
  print(response.body);
  print('==============================================');
  if(response.statusCode == 200) {
    var Doctors = AllDoctorModelFromJson(response.body);
    return Doctors.Doctors;
  } else{
    return[];
  }
}

  static AddDepartment({
    //required String token,
    required String speciality,
    required DateTime openTime,
    required  DateTime closeTime,
  }) async{
    String myUrl = "$serverUrl/api/addDepartment";
    var response = await http.post(Uri.parse(myUrl),
              headers: {
                'Accept': 'application/json',
                //'auth-token': token,
              },
              body: {
                'name': speciality,
                'open_time':time.format(openTime),
                'close_time':time.format(closeTime),
              }
          );
    var data = json.decode(response.body);
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================data======================');
          print(data);
    print('==============================================');
  }

  static Future<List<DepartmentModel>> getDepartments({required String token,}) async{
    String myUrl = "$serverUrl/api/auth/showAllDepartment";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var Departments = AllDepartmentModelFromJson(response.body);
      return Departments.Departments;
    } else{
      return[];
    }
  }

  static Future<List<DoctorModel>> getDepDoctors({
    //required String token,
    required int departmentId,
  }) async{
    String myUrl = "$serverUrl/api/doctorDepartment/$departmentId";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          //'auth-token': token,
          //'departmentId':departmentId.toString(),
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var Doctors = AllDoctorModelFromJson(response.body);
      return Doctors.Doctors;
    } else{
      return[];
    }
  }

  static Future AddArticle({
     required String token,
    required String title,
    required File image,
    required String description,
  }) async {
    FormData fromData = FormData.fromMap({
      'name': title,
      'body': description,
      'image': await MultipartFile.fromFile(image.path , filename: image.path.split('/').last,),
    });
    Response? response = await dio.post(
      'http://192.168.1.110:8000/api/auth/addArticle',
      data:fromData,
      options: Options(
          headers: <String,String>{
            'Accept': 'application/json',
            'auth-token': token,
          }
      ),
    ).then((value) {
      print('========================data======================');
      print(value.data);
      print('=======================statusCode=================');
      print(value.statusCode);
      print('=================================================');
    }).catchError((error){
      print(error.toString());
    });
  }

  static Future<List<ArticleModel>> getArticle({required String token,}) async{
    String myUrl = "$serverUrl/api/auth/showAllArticle";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var Articles = AllArticleModelFromJson(response.body);
      return Articles.Articles;
    } else{
      return[];
    }
  }
  static addappoitment({
    required String token,
    required int doctorId,
    //required int departmentId,
    //required int patientId,
    required DateTime appdate,
    required DateTime apptime,
  }) async {
    String myUrl = "$serverUrl/api/addReservation";
    final response = await http.post(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        },
        body: {
      "doctor_id":2.toString(),
        //"department_id":departmentId.toString(),
          //"patientId":patientId,
          "date": date.format(appdate),
          "start_time": time.format(apptime),
        });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
  }

  static Future<List<AppointmentModel>> getPatientAppointment({
    required String token,
    required String userId,
  }) async{
    String myUrl = "$serverUrl/api/patientRes/$userId";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var Appointments = AllAppointmentModelFromJson(response.body);
      return Appointments.Appointments;
    } else{
      return[];
    }
  }

  static Future<List<AppointmentModel>> getDoctorAppointment({
    required String token,
    required int userId,
  }) async{
    String myUrl = "$serverUrl/api/doctorRes/$userId";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('===============getDoctorAppointment========statusCode=================');
    print(response.statusCode);
    print('===============getDoctorAppointment=========body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var Appointments = AllAppointmentModelFromJson(response.body);
      return Appointments.Appointments;
    } else{
      return[];
    }
  }

  static Future<List<PatientModel>> getPatients({
    required String token,
    required String userId,
  }) async{
    String myUrl = "$serverUrl/api/patient/2";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('====================getPatients===statusCode=================');
    print(response.statusCode);
    print('====================getPatients====body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var patients = AllPatientModelFromJson(response.body);
      return patients.patients;
    } else{
      return[];
    }
  }

  static AddDiagnosis({
    required String token,
    required  String doctorId,
    required  String doctorName,
    required String patientId,
    required String patientName,
    required String diagnosis,
    required String price,
  }) async{
    String myUrl = "$serverUrl/api/addDiagnosis";
    var response = await http.post(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        },
        body: {
          'doctor_id': 2.toString(),
          'patient_id':patientId,
          'doctorName':doctorName,
          'patientName': patientName,
          'diagnosis':diagnosis,
          'price':price,
        }
    );
    var data = json.decode(response.body);
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================data======================');
    print(data);
    print('==============================================');
  }

  static Future<List<DiagnosisModel>> getDiagnosis({
    required String token,
    required int userId,//doctor
    required  int patientId,
  }) async{
    String myUrl = "$serverUrl/";
    var response = await http.get(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
          'userId':userId.toString(),
          'patientId':patientId.toString(),
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var diagnosis = AllDiagnosisModelFromJson(response.body);
      return diagnosis.Diagnosiss;
    } else{
      return[];
    }
  }


  static var serverToken ='';
  static sendNotification(String title ,String body , String id ) async{
    await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$serverToken',
        },
        body:jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            'body': body.toString(),
            'title': title.toString(),
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': id.toString(),
            //'name':
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },),);
}

  static Future getSearch({required String text,}) async {
    var url = '$serverUrl/api/search';
    var response = await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'name': text,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    if(response.statusCode == 200) {
      var search = AllDoctorModelFromJson(response.body);
      return search.Doctors;
    } else{
      return[];
    }


  }


  static Future getMe({required String token,}) async {
    var url = '$serverUrl/api/auth/me';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    var data = json.decode(response.body);
    print(data);
    if(response.statusCode == 200) {
      userId = data["id"];
      userName=data["name"];
    } else{
      return;
    }


  }

  static Future getdocMe({required String token,}) async {
    var url = '$serverUrl';
    var response = await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token,
        });
    print('=======================statusCode=================');
    print(response.statusCode);
    print('========================body======================');
    print(response.body);
    print('==============================================');
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      doctorId = data["id"];
      doctorName = data["name"];
    } else {
      return;
    }
  }


  static void loginData1({
    required String email,
    required String pass,
    //required var isAdmin,
   // required var isDoctor,
    // var isPatient,
  }) async {
    String myUrl = "$serverUrl/api/login";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
      "password": pass,
      // 'isAdmin': 'false',
      // 'isDoctor':isDoctor,
      // 'isPatient':'false',
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(DoctorLayout());
    }
    token = data["access_token"];
    //userId = data["userId"];
    // print('data : ${data["access_token"]}');
    // _save(data["access_token"]);
  }

  static void loginData2({
    required String email,
    required String pass,
    //required var isAdmin,
    //required var isDoctor,
   // required var isPatient,
  }) async {
    String myUrl = "$serverUrl/api/login";
    final response = await http.post(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json'
        }, body: {
          "email": email,
          "password": pass,
          // 'isAdmin': 'false',
          // 'isDoctor':'false',
          // 'isPatient':isPatient,
        });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(PatientLayout());
    }
    token = data["access_token"];
    //userId = data["userId"];
    // print('data : ${data["access_token"]}');
    // _save(data["access_token"]);
  }

  static registerData(String fname, String lname, String email, String password,
      String phone, String pass2) async {
    String myUrl = "$serverUrl/api/register";
    final response = await http.post(Uri.parse(myUrl),
        headers: {
          'Accept': 'application/json'
        }, body: {
          "name": "$fname $lname",
          "email": email,
          "phone": phone,
          "password": password,
          "c_password": pass2,
        });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(PatientLayout());
    }
    token = data["access_token"];
    userId = data["userId"];
    // print('data : ${data["data"]}');
    // _save(data["data"]);
  }

  static repassData(String email) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(forgotpasswordverification_admin());
    }
  }

  static repassData1(String email) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
     Get.to(forgotpasswordverification_doctor());
    }
  }

  static repassData2(String email) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(forgotpasswordverification_patient());
    }
  }

  static repassvData(var code) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "code": "$code",
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(reset_newpassAdmin());
    }
  }

  static repassvData1(var code) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "code": "$code",
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(resetpassdoc());
    }
  }

  static repassvData2(var code) async {
    String myUrl = "$serverUrl/check password";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "code": "$code",
    });
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(resetpasspatient());
    }
  }

  static newpass(String pass, String c_pass) async {
    String myUrl = "$serverUrl/reset password";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"pass": "$pass", "cpass": "$c_pass"});
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to((AdminLayout()));
    }

  }

  static newpass1(String pass, String c_pass) async {
    String myUrl = "$serverUrl/reset password";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"pass": "$pass", "cpass": "$c_pass"});
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to((DoctorLayout()));
    }

  }

  static newpass2(String pass, String c_pass) async {
    String myUrl = "$serverUrl/reset password";
    final response = await http.post(Uri.parse(myUrl),
        headers: {'Accept': 'application/json'},
        body: {"pass": "$pass", "cpass": "$c_pass"});
    var data = json.decode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to((PatientLayout()));
    }

  }



}