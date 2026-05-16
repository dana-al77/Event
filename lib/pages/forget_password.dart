import 'package:flutter/material.dart';

import '../widget/textfiled_forgrtpassword.dart';







class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});


  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {



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
          SingleChildScrollView(
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
                child: TextFieldforgetpass(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}