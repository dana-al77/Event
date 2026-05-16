import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/profile_servic.dart';
import '../components/servel.dart';
import 'package:http/http.dart' as http;
import '../widget/UserProfileWidget.dart';
import '../widget/grident_appBar.dart';


class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Map<String, dynamic> userData = {}; // تخزين بيانات المستخدم

  @override
  void initState() {
    super.initState();
    // جلب بيانات المستخدم عند تحميل الشاشة
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final url = '${SERVERURL.serverURL}api/Profile'; // استبدل برابط نقطة النهاية الخاصة بك
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    print("$token");
    SharedPreferences sharedPrefid = await SharedPreferences.getInstance();
    String? id = sharedPrefid.getString('id');
    print("$id");
    SharedPreferences sharedPrefname = await SharedPreferences.getInstance();
    String? name = sharedPrefname.getString('name');
    print("$name");
    SharedPreferences sharedPrefemail = await SharedPreferences.getInstance();
    String? email = sharedPrefemail.getString('email');
    print("$email");
    SharedPreferences sharedPrefphone = await SharedPreferences.getInstance();
    String? phone = sharedPrefphone.getString('phone');
    print("$phone");
    try {
      print("hi profile==============");
      final response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
        print(response.body.toString());
      setState(() {
        final responseData = json.decode(response.body);
        userData = responseData['data'];
      });

    } catch (e) {
      // التعامل مع أخطاء الشبكة
      print('خطأ في جلب بيانات المستخدم: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: GradientAppBar(title: 'Personal profile'),


      body: userData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : UserProfileWidget(userData: userData),
    );
  }
}