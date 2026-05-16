import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/servel.dart';
import '../model/profile_model.dart';


class ProfileService {
  static Future<Profile?> fetchUserProfile() async {
    final String apiUrl = '${SERVERURL.serverURL}api/Profile'; // استبدل بعنوان الخادم الخاص بك
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    print("$token");
    try {
      print("=============API==========");


      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("responseتتتتتتتتتتتتتتتتتتتتتتتتتتتتتتتتتت");
      print(response);
      final jsonData = jsonDecode(response.body);
      print("jsonData: $jsonData");

      if (jsonData != null && jsonData['data'] != null) {
        print("jsonData['data']: ${jsonData['data']}");

        print("jsonData['data']['id']: ${jsonData['data']['id']}");
        print("jsonData['data']['name']: ${jsonData['data']['name']}");
        print("jsonData['data']['email']: ${jsonData['data']['email']}");
        print("jsonData['data']['phone']: ${jsonData['data']['phone']}");

        final userProfile = Profile.fromJson(jsonData['data']);
        print("$userProfile");
        return userProfile;
      } else {
        print("البيانات أو data['data'] تعيد قيمة فارغة (null)");
        return null; // أو يمكنك التعامل مع هذه الحالة بطريقة مناسبة هنا
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      return null;
    }

  }
}
