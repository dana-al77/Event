
import 'package:flutter/material.dart';

import '../model/Categorymodel.dart';
import 'Categorycard.dart';

class ListCategorycard extends StatelessWidget {
  final List<Categorymodel> Categories;
  const ListCategorycard({super.key,required this.Categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Categories.length,
          itemBuilder: (context,index){
            return Categorycard(categoryModel:Categories[index], );
          }
      ),
    );
  }
}

