class SignModel{
  bool? success;
  String? message;
  String? token;

  SignModel.fromJson(Map<String,dynamic>json){
    message=json['message'];
     token=json['data'];
    success=json['success'];
  }

  }

class UserModel{
  int? id;
  String? name;
  String? email;
  int? gender;
  String? birthdate;
  String? password;
  String? confirmPas;
  String ? image;

  // UserModel({
  //   this.email,
  //   this.password,
  //   this.name,
  //   this.image,
  //   this.id,
  // });

  UserModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    gender=json['gender'];
    birthdate=json['birthdate'];
    password=json['password'];
    confirmPas=json['confirmPas'];
    image=json['img'];
  }

}
