

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled11/components/servel.dart';

import '../pages/success_sign_up.dart';

// دالة لإرسال طلب POST للتحقق من رمز التحقق إلى الخادم
Future<void> verifyOTP(String otp) async {
  var url = Uri.parse('${SERVERURL.serverURL}api/verifyEmail');

  var response = await http.post(url, body: {
    'code': otp,
  });

  if (response.statusCode == 200) {
    // التحقق من صحة الرد - يمكنك التحقق هنا من رد الخادم واتخاذ الإجراء المناسب
    if (response.body == 'valid') {
      // إذا كان الرمز صحيحاً
      // انتقل إلى الصفحة التالية بعد التحقق
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => SuccessSignUp()),
      );
    } else {
      // إذا كان الرمز غير صحيح
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(
          content: Text("The entered OTP is incorrect. Please try again."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } else {
    // في حالة وجود خطأ في الاتصال بالخادم
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(
        content: Text("Failed to verify OTP. Please try again later."),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
