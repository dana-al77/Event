import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom TextField.dart';

import '../components/servel.dart';

import 'package:http/http.dart' as http;

import 'grident_appBar.dart';

class UpdateProfile extends StatefulWidget {
  final Map<String, dynamic> data;

  UpdateProfile({required this.data, Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfController = TextEditingController();
  String _buttonText = 'Ok'; // نص الزر الافتراضي

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print(widget.data['name']);


      nameController.text = widget.data['name'] ?? '';
      emailController.text = widget.data['email'] ?? '';
      phoneController.text = widget.data['phone'] ?? '';
      passwordController.text = widget.data['password'] ?? '';
      passConfController.text = widget.data['password confirmation'] ?? '';
    nameController.text = nameController.text ;
    }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: 'Update your profile'),
      body: ListView(
        padding: EdgeInsets.all(50),
        children: [
          CustomTextField(
            control: nameController,
            labelText: 'name',
            hintText: 'Enter your name',
            textInputType: TextInputType.name,
            suffixIcon: Icon(
              Icons.person_2,
              color: Colors.blueGrey,
            ),
            cursorColor: Colors.purpleAccent,
          ),
          SizedBox(height: 10,),
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
          ),
          SizedBox(height: 10,),
          CustomTextField(
            control: phoneController,
            labelText: 'phone',
            hintText: 'Enter your phone',
            textInputType: TextInputType.phone, // تم تصحيح نوع الإدخال
            suffixIcon: Icon(
              Icons.phone,
              color: Colors.blueGrey,
            ),
            cursorColor: Colors.purpleAccent,
          ),
          SizedBox(height: 10,),
          CustomTextField(
            control: passwordController,
            labelText: 'password',
            hintText: 'Enter your new password',
            textInputType: TextInputType.text,
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.blueGrey,
            ),
            cursorColor: Colors.purpleAccent,
          ),
          SizedBox(height: 10,),
          CustomTextField(
            control: passConfController,
            labelText: 'cofirm password',
            hintText: 'Enter your new password',
            textInputType: TextInputType.text,
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.blueGrey,
            ),
            cursorColor: Colors.purpleAccent,
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              UpdateUser();
            },

            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.purpleAccent[100],
                borderRadius: BorderRadius.circular(12),

              ),
              child: Center(
                child: Text(
                  _buttonText,
                  style: TextStyle(fontFamily: 'Angkor', fontSize: 22,color: Colors.white),
                ),
              ),
            )

          )
        ],
      ),
    );
  }

  void UpdateUser() async {
    print("===============");
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');

    if (token != null) {
      print("$token");
      var url = Uri.parse('${SERVERURL.serverURL}api/update');

      var response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'name': nameController.text ?? '',
          'email': emailController.text ?? '',
          'phone': phoneController.text ?? '',
          'password': passwordController.text ?? '',
          'password confirmation': passConfController.text ?? '',
        },
      );

      print('${SERVERURL.serverURL}api/update');
      if (response.statusCode == 200) {
        setState(() {
          _buttonText = 'Success Update!'; // تغيير نص الزر بعد نجاح التحديث
        });
        // تعيين تأخير لاستعادة النص الأصلي بعد بضع ثواني
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            _buttonText = 'Ok';
          });
        });

      } else {
        print('Failed to update user. Error: ${response.body}');
        // Handle other status codes or errors here
      }
    } else {
      print('Token is null. Cannot update user.');
      // Handle case where token is null
    }
  }
}
