import 'dart:convert';


AllDiagnosisModel AllDiagnosisModelFromJson(String str ) => AllDiagnosisModel.fromJson(json.decode(str));

class AllDiagnosisModel{
  AllDiagnosisModel({
    required this.Diagnosiss,
  });

  List<DiagnosisModel> Diagnosiss ;

  factory AllDiagnosisModel.fromJson(Map<String,dynamic>json)=> AllDiagnosisModel(
    Diagnosiss: List<DiagnosisModel>.from(json["message"].map((x)=>DiagnosisModel.fromJson(x))),
  );

}

class DiagnosisModel {
   int? diagnosisId;
   int? doctorId;
   int? patientId;
   String? patientName;
   String? doctorName;
   String? description;
   String? price;

  DiagnosisModel({
    this.diagnosisId,
    this.patientId,
    this.doctorId,
    this.patientName,
    this.doctorName,
    this.description,
    this.price,
  });

  DiagnosisModel.fromJson(Map<String,dynamic>json){
    diagnosisId=json['id'];
    doctorId=json['doctor_id'];
    patientId=json['patient_id'];
    patientName=json['patientName'];
    doctorName=json['doctorName'];
    description=json['diagnosis'];
    price=json['price'];
  }

}
