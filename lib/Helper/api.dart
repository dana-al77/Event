
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Api {
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
      ///////////////////////////////////////////////////////////////////////////////////////////print("Response body: ${response.body}"); ضفت
   //   print("Response body: ${response.body}"); // طباعة البيانات الخام
      return jsonDecode(response.body)['data']; // Retrieve only the 'data' key
    } else {
      throw Exception("There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}

