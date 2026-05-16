import 'package:flutter/material.dart';

class CustomTextFieldd extends StatelessWidget {
  const CustomTextFieldd({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.purpleAccent,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: (){
            ///////////NAVIGATOR
          },child: Icon(Icons.search,color: Colors.black12,),
        ),

        hintText: "search from events",
        hintStyle: TextStyle(color: Colors.black,fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Colors.purpleAccent
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:BorderSide(
              color: Colors.purpleAccent
          ) ,
        ),
      ),
    );
  }
}