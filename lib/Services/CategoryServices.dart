
import 'package:untitled11/components/servel.dart';

import '../Helper/api.dart';
import '../model/Categorymodel.dart';

class CategoryServices {
 static Future<List<Categorymodel>> getCategory() async {
    print("================CategoryServices============");
    try {
      // استدعاء الطلب API بشكل منفصل
      var apiUrl = "${SERVERURL.serverURL}api/show_all_event_type";
      print("API URL: $apiUrl");
      List<dynamic> data = await Api().get(url: apiUrl);
      print("Data retrieved from API: $data");

      // تحويل البيانات إلى كائنات Categorymodel
      List<Categorymodel> categoryList = [];
      for (int i = 0; i < data.length; i++) {
        categoryList.add(Categorymodel.fromJson(data[i]));
        print("$categoryList");
      }
      return categoryList;
    } catch (e) {
      // طباعة الاستثناء في حالة حدوث أي خطأ
      print("Error while fetching categories: $e");
      return [];
    }
  }

}




