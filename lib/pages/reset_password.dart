import 'package:flutter/material.dart';
import '../model/check_code_pass.dart';
import '../widget/textfield_reset_password.dart';





class ResetPassWord extends StatefulWidget {

final String code;

  const ResetPassWord({Key? key,required this.code }) : super(key: key);


  @override
  State<ResetPassWord> createState() => _ResetPassWordState();
}

class _ResetPassWordState extends State<ResetPassWord> {



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
                  child: TextFieldResetPass(code:widget.code ,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}