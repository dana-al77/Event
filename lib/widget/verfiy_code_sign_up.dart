
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled11/components/servel.dart';
import '../components/cutomText.dart';
import '../model/regestir_model.dart';
import '../model/register_from_data.dart';
import '../pages/success_sign_up.dart';
import 'package:http/http.dart' as http;






class TextFieldVerfiyEmail extends StatefulWidget {
  final RegisterFormData registerData;

  const TextFieldVerfiyEmail({Key? key, required this.registerData}) : super(key: key);



  @override
  State<TextFieldVerfiyEmail> createState() => _TextFieldVerfiyEmailState();
}


class _TextFieldVerfiyEmailState extends State<TextFieldVerfiyEmail> {






  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();


  Future<void> verifyOTP(String otp) async {
    var url = Uri.parse('${SERVERURL.serverURL}api/verifyEmail');
       print("=========code verfiy=========");
    print("=========code verfiy=========");
    var response = await http.post(url, body: {
      'code': otp,
      'email':widget.registerData.email,

    },
    headers: {
    'Accept':'application/json'
    });
    var js=jsonDecode(response.body);
    print("message======${js['message']}");
    print("response is ${response.body}");


    if (js['message']=='Email verified successfully') {
      // التحقق من صحة الرد - يمكنك التحقق هنا من رد الخادم واتخاذ الإجراء المناسب




      // إذا كان الرمز صحيحاً
        // انتقل إلى الصفحة التالية بعد التحقق
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessSignUp()),
        );
        // تحديث emailVerifiedAt بعد التحقق

      /*
      else {
        // إذا كان الرمز غير صحيح
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The entered OTP is incorrect. Please try again."),
            duration: Duration(seconds: 2),
          ),
        );
      }
       */
    } else {
      // في حالة وجود خطأ في الاتصال بالخادم
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("The entered OTP is incorrect. Please try again."),
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
              'Please Enter the code sent to your ُEmail',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 60,
            ),
            PinCodeTextField( // استخدام PinCodeTextField هنا
              appContext: context,
              length: 6,
              controller: otpController,
              onChanged: (value) {
                // يمكنك إضافة الكود الخاص بك هنا للتعامل مع التغييرات
              },
              onCompleted: (value) {
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
