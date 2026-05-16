import 'package:flutter/material.dart';
import '../widget/verfiy_code.dart';








class VeryfiyCodeEmailPass extends StatefulWidget {
  const VeryfiyCodeEmailPass({super.key});


  @override
  State<VeryfiyCodeEmailPass> createState() => _VeryfiyCodeEmailPassState();
}

class _VeryfiyCodeEmailPassState extends State<VeryfiyCodeEmailPass> {



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
                child: TextFieldVerfiyEmailpass(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}