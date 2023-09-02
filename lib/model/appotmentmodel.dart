import 'dart:convert';


AllAppointmentModel AllAppointmentModelFromJson(String str ) => AllAppointmentModel.fromJson(json.decode(str));

class AllAppointmentModel{
  AllAppointmentModel({
    required this.Appointments,
  });

  List<AppointmentModel> Appointments ;

  factory AllAppointmentModel.fromJson(Map<String,dynamic>json)=> AllAppointmentModel(
    Appointments: List<AppointmentModel>.from(json["message"].map((x)=>AppointmentModel.fromJson(x))),
  );


}


class AppointmentModel {
  int? id;
   int? doctorId;
   int? patientId;
   int? departmentId;
   String? doctorName;
   String? patientName;
   String? departmentName;
   String? appTime;
   String? appDate;

  AppointmentModel({
    this.id,
    this.doctorId,
    this.patientId,
    this.departmentId,
    this.doctorName,
    this.patientName,
    this.departmentName,
    this.appTime,
    this.appDate,
  });
  AppointmentModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    doctorId=json['user_id'];
    patientId=json['patient_id'];
    //departmentId=json['password'];
     doctorName=json['name'];
    // patientName=json['img'];
    departmentName=json['speciality'];
    appTime=json['start_time'];
    appDate=json['date'];

  }
}
