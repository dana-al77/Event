import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class getErrorUI extends StatelessWidget {
  getErrorUI({required this.error,super.key,});
  String error;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(error, style: TextStyle(fontSize: 20, color: Colors.purpleAccent)),
    );
  }
}