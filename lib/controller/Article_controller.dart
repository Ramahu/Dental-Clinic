import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Network/DataBaseHelper.dart';
import '../model/Article_model.dart';
import '../shared/components/constants.dart';

class ArticleController extends GetxController {

  List<ArticleModel> ArticleList =[];
  var isLoading = true.obs;
  var imagePath=''.obs;
  final imagePicker= ImagePicker();
  // final article = <ArticleModel>[].obs;
  // List<ArticleModel> get articleList => article.value;


  void pickImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage!= null) {
      imagePath.value = pickedImage.path;
    }
    else{}
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void onReady() async{
    ArticleList = await DataBaseHelper.getArticle(
      token: token.toString(),
    );
    isLoading(false);
    super.onReady();

  }

// void addArticle(ArticleModel departmentModel){
//   article.add( departmentModel);
// }

// void removeArticle(ArticleModel departmentModel){
//   article.remove(departmentModel);
// }

}
