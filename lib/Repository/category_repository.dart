/*

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../components/servel.dart';
import '../main.dart';
import '../model/Categorymodel.dart';

class CategoryRepository {
  static var client = http.Client();
  var data = [];


  static Future<CategoryListModel> fetchAllCategories() async {

    sharedPref=await SharedPreferences.getInstance();
    String? tok=sharedPref.getString('token');
    print('1112222222222222');
    var response = await client.get(
        Uri.parse("${SERVERURL.serverURL}api/show_all_event_type"),
        headers: {
          'Authorization': 'Bearer $tok',
        }
    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if (response.statusCode == 200) {
      return CategoryListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Categories from API');
    }
  }
}


 */