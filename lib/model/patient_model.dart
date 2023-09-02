import 'dart:convert';


AllPatientModel AllPatientModelFromJson(String str ) => AllPatientModel.fromJson(json.decode(str));

class AllPatientModel{
  AllPatientModel({
    required this.patients,
  });

  List<PatientModel> patients ;

  factory AllPatientModel.fromJson(Map<String,dynamic>json)=> AllPatientModel(
    patients: List<PatientModel>.from(json["message"].map((x)=>PatientModel.fromJson(x))),
  );

}

class PatientModel {
   int? patientId;
   String? name;
   //String? image;

  PatientModel({
     this.patientId,
    this.name,
    //this.image,
  });
   PatientModel.fromJson(Map<String,dynamic>json){
      patientId=json['patient_id'];
    name=json['name'];
    //image=json['image'];

  }
}
