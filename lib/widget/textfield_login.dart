import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled11/model/regestir_model.dart';
import '../components/custom TextField.dart';
import '../components/cutomText.dart';
import '../components/servel.dart';
import '../pages/Categoryview.dart';
import '../pages/Regestir_screen.dart';
import '../pages/forget_password.dart';
import '../sharedPrefernce/shared_pref.dart';
import 'package:http/http.dart' as http;







class TextFieldLogin extends StatefulWidget {
  const TextFieldLogin({super.key});

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {

  LoginModel _loginModel = LoginModel();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  bool isUserSelected = true; // تمثل اختيار المستخدم





  Future<LoginModel?> login(String email,String pass)async{

    print("22222222222222222222222222");
    print(email);
    var response=await http.post(Uri.parse('${SERVERURL.serverURL}api/login'),

        body: {
          'email':email,
          'password':pass,

        },headers: {
          'Accept':'application/json',
        }
    );
    print("response is ${response.body}");
  //  print("stutas is ${response.statusCode}");
    var js=jsonDecode(response.body);
    print("status is ${js["status"]}");
    print("${js['user']['id']}");
    print("${js['user']['name']}");
    print("${js['user']['email']}");
    print("${js['user']['phone']}");

 print("${js['user']['email_verified_at']}");
print("${js['user']['google_id']}");
print("=====================================================");
//_loginModel = LoginModel.fromJson(js);

    if (response.statusCode == 200 && js['message']=='logged in successfully') {
      print('token isssssss ${js['authorisation']['token']}');
        CacheNetWork.insertToCache(key: "token", value: js['authorisation']['token']);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categoryview()));
       }
    else if(js['status']=='error'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: CustomText('Error',style: TextStyle(color: Colors.purple),),
            content: Text('fail login.please make sure information'),
            actions: <Widget>[
              TextButton(
                child:  CustomText('ok',style: TextStyle(color: Colors.purple),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else{
      print('================ Token not save');
      showDialog(context: context, builder: (BuildContext){
        return AlertDialog(
          title: Text('خطأ'),
          content: Text("فشل تسجيل الدخول الرجاء التأكد من المعلومات"),
          actions:<Widget> [
            InkWell(child: Container(
                child: Center(child: Text("موافق")),
                color: Colors.blueGrey),
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
            SizedBox(height: 18,),
            CustomText(
              'Login',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            SizedBox(height: 5,),
            CustomText(
              'Please enter your personal information',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
               // fontFamily: 'Angkor',
              ),
            ),
            SizedBox(
              height: 20,
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
            SizedBox(height: 20),
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
            SizedBox(height: 20),


            SizedBox(height: 25,),
            Center(
              child: ElevatedButton(

                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                    fixedSize: MaterialStateProperty.all<Size>(Size(130, 50)),
                    elevation: MaterialStateProperty.all<double>(26), // تعيين قيمة الارتفاع للظل هنا (هنا 8)
                  ),
                  onPressed: () {
                   if(formKey.currentState!.validate()){
                     login(emailController.text.trim(),passController.text.trim());
                   }
                  },
                  child: CustomText(
                    'Login',
                    style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Angkor',),

                  )),


            ),
           SizedBox(height: 15,),
        /*    ElevatedButton.icon(
              onPressed: (){},
              icon: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLu3w13SGl4srueLZinVQjL_iwtl9dJI78hqOmfwN8Zwv3WYFotvfLveeEQ0HUoo2vyEM&usqp=CAU', // استبدل بمسار الصورة الخاصة بأيقونة Google
                width: 24, // اختياري: تحديد عرض الصورة
                height: 24, // اختياري: تحديد ارتفاع الصورة
              ),
              label: Text('Login with Google'),
            ),
            SizedBox(height: 15,),*/
            Row(children: [
              CustomText('Dont have Account?',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Angkor'),),
              MaterialButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegestirScreen(),));
              },child: CustomText('regerstir',style: TextStyle(color: Colors.purple,fontSize: 18,fontFamily: 'Angkor',),),)
            ]),
            Row(children: [
              CustomText('Forget password?',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Angkor'),),
              MaterialButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
              },child: CustomText('reset',style: TextStyle(color: Colors.purple,fontSize: 18,fontFamily: 'Angkor',),),)
            ]),
          ],
        ),
      ),
    );
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
////////////////////////////////////  هون نوع الحساب
/*   Row(
              children: [
                CustomText(
                  'Account Type: ',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontFamily: 'Angkor',
                  ),
                ),
                Radio(
                    value: true,
                    groupValue: isUserSelected,
                    onChanged: ( value) {
                      setState(() {
                        isUserSelected = value!;}
                      );
                    },
                  activeColor: Colors.purpleAccent,
                ),
                CustomText(
                  'User',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: 'Angkor',
                  ),
                ),
                Radio(
                  value: false,
                  groupValue: isUserSelected,
                  onChanged: (value) {
                    setState(() {
                      isUserSelected = value!;
                    });
                  },
                  activeColor: Colors.purpleAccent,
                ),
                CustomText(
                  'Admin',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: 'Angkor',
                  ),
                ),
              ],
            ),*/
/*
 @override
  void initState() {
    super.initState();
    _loginModel = LoginModel(); // تهيئة _loginModel هنا
  }
  _loginModel.user.emailVerifiedAt = DateTime.now().toString();

  print("$_loginModel");
  print("${_loginModel!.user!.emailVerifiedAt}");
 */