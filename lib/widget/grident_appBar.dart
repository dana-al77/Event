import 'package:flutter/material.dart';
import 'package:untitled11/widget/wive_clipper.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 200.0; // Match height
  final String title;
  GradientAppBar({required this.title});
  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        color: Colors.purpleAccent[100],
        height: 300.0,
        child: Center(child: Text( '$title',style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,fontFamily: 'Angkor',fontSize: 29),)),
      ),
    );
  }
}