import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiReservation {
  Future<dynamic> get({required String url}) async {
    print("=============API==========");
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token"
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      // هنا نقوم بالتأكد من أن المفتاح 'reservations' موجود في الاستجابة
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse.containsKey('reservations')) {
        return jsonResponse['reservations']; // استرجاع فقط مفتاح 'reservations'
      } else {
        throw Exception("Key 'reservations' not found in the response");
      }
    } else {
      throw Exception("There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}
