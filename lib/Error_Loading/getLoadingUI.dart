import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class getLoadingUI extends StatelessWidget {
  const getLoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
          ),
          Text("Loading...", style: TextStyle(fontSize: 20, color: Colors.purpleAccent)),
        ],
      ),
    );
  }
}