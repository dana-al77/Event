import 'package:flutter/material.dart';

import '../widget/textfield_login.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String loginScreenRout = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/img7.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.purpleAccent
                .withOpacity(0.0), // لون شفاف مع مستوى الشفافية الذي تحتاجه
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 300),
                  height: MediaQuery.of(context).size.height - 100,
                //  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: TextFieldLogin(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}