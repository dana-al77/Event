import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/pages/home_page.dart';
import 'package:untitled11/sharedPrefernce/shared_pref.dart';

import '../components/custom TextField.dart';
import '../components/cutomText.dart';
import '../components/servel.dart';

import '../components/token.dart';
import '../model/login_model.dart';
import '../model/register_from_data.dart';
import '../pages/Login_screen.dart';

import 'package:http/http.dart' as http;

import '../pages/veryfiy_code_sign_up_screen.dart';





RegisterModel?regestirModel;
class TextFieldRegestir extends StatefulWidget {

  const TextFieldRegestir({super.key});

  @override
  State<TextFieldRegestir> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldRegestir> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController passConfController = new TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  bool isUserSelected = true; // تمثل اختيار المستخدم





  Future signup(String name ,String email,String phone,String pass,String confpassword)async{

    print("1111111111111111111111111111111111111111111111111111111111111111111111111111");
    print(phone);
    var response=await http.post(Uri.parse('${SERVERURL.serverURL}api/register'),

        body: {
          'name':name,
          'email':email,
          'phone':phone,
          'password':pass,
          'password_confirmation':confpassword,


        },
        headers: {
          'Accept':'application/json',
        }
    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    var js=jsonDecode(response.body);
    print("status is ${js["status"]}");

    print("Response body: $js");
    int id = js['data']['id'];
    print(id);
    (await CacheNetWork.insertToCache(key: "id", value: id.toString()));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    if (js['status'] == 'success') {
      if (js.containsKey('data') && js['data'] != null && js['data'].containsKey('token')) {
        bool saved = await CacheNetWork.insertToCache(key: "token", value: js['data']['token']);


        if (saved) {
          token = js['data']['token'];
          print('Token saved successfully: $token');
        } else {
          print('Failed to save token');
        }
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VeryfiyCodeSignUp(registerData: RegisterFormData(
          name: userNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passController.text,
          confirmPassword: passConfController.text,
        ),),));
      } else {
        print('Token not found in response');
        showDialog(context: context, builder: (BuildContext) {
          return AlertDialog(
            title: Text('Error', style: TextStyle(color: Colors.purple)),
            content: Text("Failed to sign up. Please ensure information"),
            actions: <Widget>[
              InkWell(
                child: Container(
                  child: Center(child: Text("OK")),
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
      }
    } else {
      print('Token not saved');
      showDialog(context: context, builder: (BuildContext) {
        return AlertDialog(
          title: Text('Error',style: TextStyle(color: Colors.purple),),
          content: Text("fail to sign up please ensure information"),
          actions:<Widget> [
            InkWell(child: Container(
                child: Center(child: Text("ok")),
                color: Colors.purple),
              onTap:  (){
                Navigator.of(context).pop();
              },)
          ],
        );
      });
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
              'Regestir',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(
              'Please enter your personal information',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
            //    fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              control: userNameController,
              labelText: 'User Name',
              hintText: 'Enter your name',
              textInputType: TextInputType.name,
              suffixIcon: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              cursorColor: Colors.purpleAccent,
              validator: validateUserName,
            ),
            SizedBox(height: 8,),
            CustomTextField(
              control: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.email_rounded,
                color: Colors.blueGrey,
              ),
              cursorColor: Colors.purpleAccent,
              //////////////////////////////////////////////////////
              validator: validateEmail,
            ),
            SizedBox(height: 8),
            CustomTextField(
              control: phoneController,
              labelText: 'Phone',
              hintText: 'Enter your phone num',
              textInputType: TextInputType.number,
              suffixIcon: Icon(
                Icons.phone_android,
                color: Colors.blueGrey,
              ),
              cursorColor: Colors.purpleAccent,
              validator: validatePhone,
            ),
            SizedBox(height: 8,),
            CustomTextField(
              control: passController,
              labelText: 'Password',
              hintText: 'Enter your password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blueGrey,
                ),
              ),
              obscureText: !isPasswordVisible,
              cursorColor: Colors.purpleAccent,
              textInputType: TextInputType.visiblePassword,
              validator: validatePassword,
            ),
            SizedBox(height: 8,),
            CustomTextField(
              control: passConfController,
              labelText: 'Conf Password',
              hintText: 'Enter your password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blueGrey,
                ),
              ),
              obscureText: !isPasswordVisible,
              cursorColor: Colors.purpleAccent,
              textInputType: TextInputType.visiblePassword,
              validator: validatePassword,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    fixedSize: MaterialStateProperty.all<Size>(Size(130, 50)),
                  ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await signup(userNameController.text, emailController.text, phoneController.text, passController.text, passConfController.text);
                    print('======= token is======== $token');
                  }
                },
                  child: CustomText(
                    'Regestir',
                    style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Angkor',),

                  )
              ),
            ),SizedBox(height: 16,),

            Row(children: [
              CustomText('have Account?',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Angkor',),),
              MaterialButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },child: CustomText('Login',style: TextStyle(color: Colors.purple,fontSize: 18,fontFamily: 'Angkor',),),)
            ]),
          ],
        ),
      ),
    );
  }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your user name';
    }
    return null;
  }
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    }
    /*
    if (!RegExp(CustomPattern.instance.syrianPhoneNumber).hasMatch(value)) {
      return 'Please enter a valid phone';
    }
     */
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }

    // Regular expression for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    /*
    if (!RegExp(CustomPattern.instance.syrianPhoneNumber).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    */
    return null;
  }


  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // You can add more validation criteria as needed
    return null;
  }

}
