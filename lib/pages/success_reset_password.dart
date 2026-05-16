import 'package:flutter/material.dart';

import '../components/cutomText.dart';
import 'Login_screen.dart';

class SuccessResetPass extends StatefulWidget {
  const SuccessResetPass({super.key});

  @override
  State<SuccessResetPass> createState() => _SuccessResetPassState();
}

class _SuccessResetPassState extends State<SuccessResetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
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
                    width: double.infinity,
                    height: double.infinity,
                    margin:const EdgeInsets.only(top: 0),
                    //  height: MediaQuery.of(context).size.height - 100,
                    //  padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Column(


                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 159),
                            child: CustomText('Reset Password success',
                              style: TextStyle(fontSize: 24,color: Colors.purple,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 30,),
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.purpleAccent,
                            size: 250,
                          ),
                          SizedBox(height: 200,),
                          MaterialButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          },
                            child: Container(
                                width:360,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: CustomText('Go To Login',style: TextStyle(fontSize: 20,color:Colors.white ),))),)
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
