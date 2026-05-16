
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../components/cutomText.dart';
import '../components/servel.dart';
import '../pages/reset_password.dart';
import 'package:http/http.dart' as http;
import '../pages/success_reset_password.dart';








class TextFieldVerfiyEmailpass extends StatefulWidget {
  const  TextFieldVerfiyEmailpass({super.key});

  @override
  State<TextFieldVerfiyEmailpass> createState() => _TextFieldVerfiyEmailpassState();
}

class _TextFieldVerfiyEmailpassState extends State<TextFieldVerfiyEmailpass> {



  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController otpController1 = TextEditingController();
  Future<void> verifyOTP(String otp,) async {
    var url = Uri.parse('${SERVERURL.serverURL}api/password/check/code');
    print("=========code verfiy for reset password=========");

    var response = await http.post(url, body: {
      'code': otp,

    },
        headers: {
          'Accept':'application/json'
        });
    var js=jsonDecode(response.body);
    print("message======${js['message']}");
    print("response is ${response.body}");


    if (js['message'] == 'code_is_valid') {
      // التحقق من صحة الرد - يمكنك التحقق هنا من رد الخادم واتخاذ الإجراء المناسب

        // إذا كان الرمز صحيحاً
        // انتقل إلى الصفحة التالية بعد التحقق
      ////////////////////////// otp???
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetPassWord(code:otpController1.text,)),
        );


    } else {
      // في حالة وجود خطأ في الاتصال بالخادم
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to verify OTP. Please try again later."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 20,),
            CustomText(
              'Write a Code ',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(height: 10,),
            CustomText(
              'Please Enter the code sent to your dana',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 60,
            ),
            PinCodeTextField( // استخدام PinCodeTextField هنا
              appContext: context,
              length: 6,
              controller: otpController1,
              onChanged: (value) {
                // يمكنك إضافة الكود الخاص بك هنا للتعامل مع التغييرات
              },
              onCompleted: (value) {
                // هنا تتحقق من صحة الرمز OTP
              verifyOTP(value);
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                activeColor: Colors.purple, // لون الحد عندما يكون الحقل نشطًا
                selectedColor: Colors.deepPurple, // لون الحد عندما يكون الحقل محددًا
                inactiveColor: Colors.grey, // لون الحد عندما يكون الحقل غير نشط
                disabledColor: Colors.grey.shade300, // لون الحد عندما يكون الحقل معطلًا
                selectedFillColor: Colors.purple, // لون الخلفية عندما يكون الحقل محددًا
                inactiveFillColor: Colors.transparent,
              ),
              keyboardType: TextInputType.number,
            ),


          ],
        ),
      ),
    );
  }


}
