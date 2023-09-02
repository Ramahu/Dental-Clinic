import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
         'mpr':"حسابي الشخصي",
          "Title": "سلامة الأسنان",
          "Search": "ابحث هنا",
          "dr": "كافة الأطباء",
          "cp": "أقسام العيادة",
          "art": "مقالات",
          "pat": "المرضى",
          "chl": "تبديل اللغة",
          "res": "إعادة تعيين كلمة المرور",
          "dar": "الوضع الليلي",
          "lo": "تسجيل الخروج",
        },
        "en": {
          'mpr':"My profile",
          "Search": "search for doctors",
          "dr": "All Doctors",
          "cp": "Clinic Department",
          "art": "Articles",
          "pat": "All Patient",
          "chl": "Change Language",
          "res": "Reset Password",
          "dar": "Dark Mode ",
          "lo": "Logout ",
        },
      };
}
