import 'package:flutter/material.dart';
import '../model/register_from_data.dart';
import '../widget/verfiy_code_sign_up.dart';







class VeryfiyCodeSignUp extends StatefulWidget {
  final RegisterFormData registerData;

  const VeryfiyCodeSignUp({Key? key, required this.registerData}) : super(key: key);

  @override
  State<VeryfiyCodeSignUp> createState() => _VeryfiyCodeSignUpState();
}


class _VeryfiyCodeSignUpState extends State<VeryfiyCodeSignUp> {



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
                child: TextFieldVerfiyEmail(registerData:  widget.registerData,
                    
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}