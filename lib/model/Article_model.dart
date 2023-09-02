import 'dart:convert';

AllArticleModel AllArticleModelFromJson(String str )=>AllArticleModel.fromJson(json.decode(str));


class AllArticleModel{
  AllArticleModel({
    required this.Articles,
  });

  List<ArticleModel> Articles ;

  factory AllArticleModel.fromJson(Map<String,dynamic>json)=> AllArticleModel(
    Articles: List<ArticleModel>.from(json["message"].map((x)=>ArticleModel.fromJson(x))),
  );

// Map<String,dynamic> toJson() => {
//   "message": List<dynamic>.from(Doctors.map((x)=>x.toJson())),
// };
}

class ArticleModel {
   int? id;
   String? title;
   String? image;
   String? description;


  ArticleModel({
    this.id,
    this.title,
    this.image,
    this.description,
  });

  ArticleModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title=json['name'];
    image=json['image'];
    description=json['body'];

  }

}