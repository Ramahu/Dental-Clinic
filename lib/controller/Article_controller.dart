import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Network/DataBaseHelper.dart';
import '../model/Article_model.dart';
import '../shared/local/cache_helper.dart';

class ArticleController extends GetxController {

  List<ArticleModel> ArticleList =[];
  // List<ArticleModel> ArticleList = [
  //   ArticleModel(
  //     id: 1,
  //     title: "The Role of Regular Dental Checkups in Maintaining Oral Health",
  //     image: "https://laravillagedental.com.au/wp-content/uploads/2019/07/why-should-we-go-to-the-dentist-regularly-fldentalspacom-4-1024.jpg",
  //     description: "Maintaining optimal oral health is essential not only for a bright smile but also for overall well-being. Regular dental checkups play a crucial role in achieving and sustaining this goal. These visits allow dentists to monitor your oral health, identify potential issues early, and provide preventive care that can save you from more extensive and costly treatments in the future.\n\n"
  //         "During a typical dental checkup, your dentist will thoroughly examine your teeth, gums, and oral tissues to ensure there are no signs of decay, gum disease, or other complications. This step is vital because many oral health issues, such as cavities or periodontal disease, may not show obvious symptoms until they become more severe. Early detection through routine checkups enables timely intervention, which often leads to simpler and less invasive treatments.\n\n"
  //         "Professional cleaning is another essential component of regular dental visits. Despite brushing and flossing daily, plaque and tartar can accumulate in hard-to-reach areas of your mouth. Over time, this buildup can lead to tooth decay and gum inflammation. Dental hygienists use specialized tools to remove plaque and tartar, ensuring your teeth and gums remain healthy and reducing the risk of long-term damage.\n\n"
  //         "Additionally, routine dental checkups provide an opportunity for personalized oral health education. Dentists can guide you on proper brushing and flossing techniques, recommend products suited to your specific needs, and advise on dietary choices that promote healthy teeth and gums. For instance, reducing sugar intake, avoiding acidic drinks, and incorporating calcium-rich foods into your diet can significantly impact your oral health.\n\n"
  //         "Furthermore, regular visits allow your dentist to monitor for potential signs of systemic health issues. Conditions like diabetes, heart disease, and certain cancers often manifest early symptoms in the mouth. By identifying these signs, your dentist can recommend seeking further medical evaluation, potentially catching a health concern before it worsens.\n\n"
  //         "In conclusion, regular dental checkups are a cornerstone of maintaining good oral and overall health. They help prevent dental problems, ensure early detection of potential issues, and provide an opportunity for tailored advice on maintaining a healthy smile. By making dental visits a priority, you invest in not only the health of your teeth but also your general well-being. Remember, a healthy smile is a reflection of a healthy life!",
  //   ),
  // ];


  var isLoading = true.obs;
  var imagePath=''.obs;
  final imagePicker= ImagePicker();
  final article = <ArticleModel>[].obs;
  List<ArticleModel> get articleList => article.value;
  String  token = CacheHelper.getData(key: "token");


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
