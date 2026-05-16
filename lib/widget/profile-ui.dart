import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/model/profile_model.dart';

class ProfileUi extends StatelessWidget {
  ProfileUi({required this.profile, super.key});
   Profile profile;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
  Text("................................"),

        Text("ID: ${profile.data?.id ?? 'Not Available'}"),
        Text("Name: ${profile.data?.name ?? 'Not Available'}"),
        Text("Email: ${profile.data?.email ?? 'Not Available'}"),
        Text("Phone: ${profile.data?.phone ?? 'Not Available'}"),
      ],
    ),
    ),
    );
  }
}
