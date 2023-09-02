import 'dart:convert';


AllDoctorModel AllDoctorModelFromJson(String str ) => AllDoctorModel.fromJson(json.decode(str));

class AllDoctorModel{
  AllDoctorModel({
    required this.Doctors,
});

  List<DoctorModel> Doctors ;

  factory AllDoctorModel.fromJson(Map<String,dynamic>json)=> AllDoctorModel(
    Doctors: List<DoctorModel>.from(json["message"].map((x)=>DoctorModel.fromJson(x))),
  );

}

class DoctorModel{
 late int doctorId;
 late int departmentId;
   String? email;
   String? password;
   String? name;
  String ? image;
   String? speciality;
   String? description;
   String? phone;
  String? token;

  DoctorModel({
    required this.doctorId,
    required this.departmentId,
    this.email,
    this.password,
    this.name,
    this.image,
    this.speciality,
    this.description,
    this.phone,
    this.token,
  });

  DoctorModel.fromJson(Map<String,dynamic>json){
    doctorId=json['user_id'];
    departmentId=json['department_id'];
    email=json['email'];
    password=json['password'];
    name=json['name'];
    image=json['img'];
    speciality=json['speciality'];
    description=json['desc'];
    phone=json['phone'];
    token=json['token'];
  }

}