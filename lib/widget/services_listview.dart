

import 'package:flutter/material.dart';
import '../model/services_model.dart';
import '../pages/services_ui.dart';

class TypeServiceListView extends StatelessWidget {
  const TypeServiceListView({super.key, required this.TypeServices, required this.onServiceSelected});
  final List<ServicesModel> TypeServices;
  final Function(int) onServiceSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:  TypeServices.length, // تغيير هنا,
          itemBuilder: (context,index){
            return TypeService(TypeServices:TypeServices[index],onServiceSelected: onServiceSelected,);
          }
      ),
    );
  }
}