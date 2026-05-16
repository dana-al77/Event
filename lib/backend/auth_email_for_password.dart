import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled11/components/servel.dart';

class AuthEmailPassword {

  Future<bool> sendEmailForVerification(String email) async {
    print("============ Auth Email========$email ");
    final response = await http.post(

      Uri.parse('${SERVERURL.serverURL}api/password/email'),
      body: {'email': email},

    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
  var js=jsonDecode(response.body);
  print("meassage${js['message']}");
    if (response.statusCode == 200) {
     print("تم ارسال البريد الالكتروني بنجاح من اجل استعادة كلمة السر");
      return true;
    } else {
      print("لم يتم ارسال البريد الالكتروني بنجاح من اجل استعادة كلمة السر");
      return false;
    }
  }
}
