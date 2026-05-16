
import 'dart:convert';

import 'package:flutter/material.dart';
import '../backend/auth_email_for_password.dart';
import '../components/custom TextField.dart';
import '../components/cutomText.dart';
import '../components/servel.dart';
import '../pages/verfiy_code_password.dart';
import 'package:http/http.dart' as http;








   class TextFieldforgetpass extends StatefulWidget {
  const  TextFieldforgetpass({super.key});

  @override
  State<TextFieldforgetpass> createState() => _TextFieldforgetpassState();
}

class _TextFieldforgetpassState extends State<TextFieldforgetpass> {

  TextEditingController emailController = new TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();


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
    if (js['status'] == 200) {
      print("تم ارسال البريد الالكتروني بنجاح من اجل استعادة كلمة السر");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VeryfiyCodeEmailPass(),));
      return true;
    } else {
      print("لم يتم ارسال البريد الالكتروني بنجاح من اجل استعادة كلمة السر");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: CustomText('Error', style: TextStyle(color: Colors.purple),),
            content: Text('Failed to send email for verification. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: CustomText('OK', style: TextStyle(color: Colors.purple),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
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
              'Check Email',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(height: 10,),
            CustomText(
              'Please enter your Email to recive your password',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomTextField(

              control: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.email_outlined,
                color: Colors.blueGrey,
              ),
              cursorColor: Colors.purpleAccent,
              validator: validateEmail,
            ),

            SizedBox(height: 43,),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  fixedSize: MaterialStateProperty.all<Size>(Size(130, 50)),
                  elevation: MaterialStateProperty.all<double>(26),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                     print("====Auth email Password");
                     await sendEmailForVerification(emailController.text);
                  }
                },
                child: CustomText(
                  'check',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Angkor'),
                ),
              ),



            ),

          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    /*
    if (!RegExp(CustomPattern.instance.syrianPhoneNumber).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    */
    return null;
  }
}
