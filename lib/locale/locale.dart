import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
         'mpr':"حسابي الشخصي",
          "Title": "سلامة الأسنان",
          "Search": "ابحث هنا",
          "dr": "كافة الأطباء",
          "dep": "أقسام العيادة",
          "art": "المقالات",
          "pat": "المرضى",
          "chl": "تبديل اللغة",
          "res": "إعادة تعيين كلمة المرور",
          "dark": "الوضع الليلي",
          "logout": "تسجيل الخروج",
          "not" : "الأشعارات",
          "hi" : "مرحبا",
        },
        "en": {
          'mpr':"My profile",
          "Search": "search for doctors",
          "dr": "All Doctors",
          "dep": "Departments",
          "art": "Articles",
          "pat": "All Patient",
          "chl": "Change Language",
          "res": "Reset Password",
          "dark": "Dark Mode ",
          "logout": "Logout ",
          "not" : "notifications",
          "hi" : "Hi !",
        },
      };
}
