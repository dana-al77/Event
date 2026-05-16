import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/custom TextField.dart';
import '../components/cutomText.dart';
import '../components/servel.dart';
import '../pages/success_reset_password.dart';
import 'package:http/http.dart' as http;








class TextFieldResetPass extends StatefulWidget {

 final String code;
   TextFieldResetPass({Key? key,required this.code}) : super(key: key);


  @override
  State<TextFieldResetPass> createState() => _TextFieldResetPassState();
}

class _TextFieldResetPassState extends State<TextFieldResetPass> {


  TextEditingController passController = new TextEditingController();
  TextEditingController confirmationpassController = new TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  bool isUserSelected = true; // تمثل اختيار المستخدم
  late String? passwordErrorText;



  Future resetPassword(String pass,String confPass)async{

    print("===============Resert passwors=================");
    print(pass);
    var response=await http.post(Uri.parse('${SERVERURL.serverURL}api/password/reset'),

        body: {
      'code':  widget.code,
          'password':pass,
          'password_confirmation':confPass,
        },headers: {
          'Accept':'application/json',
        }
    );
    print("response is ${response.body}");

    var js=jsonDecode(response.body);
    if (js["message"] == 'password has been successfully reset') {


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessResetPass(),));
    }

    else{

      showDialog(context: context, builder: (BuildContext){
        return AlertDialog(
          title: Text('Error'),
          content: Text("fail to reset your  password .try again"),
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
              'Reset password',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Angkor',
              ),
            ),
            CustomText(
              'Please Enter your New Password',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                fontFamily: 'Angkor',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 40,
            ),
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
            CustomTextField(
              control: confirmationpassController,
              labelText: 'confirm Password',
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
                          resetPassword(passController.text, confirmationpassController.text);
                      if (passController.text != confirmationpassController.text) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: CustomText('Error',style: TextStyle(color: Colors.purple),),
                              content: Text('Passwords do not match'),
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
                      }else{
                        //  login(emailController.text.trim(),passController.text.trim());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessResetPass(),));
                      }

                    }
                  },
                  child: CustomText(
                    'Confirm',
                    style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Angkor',),

                  )),


            ),

          ],
        ),
      ),
    );
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

