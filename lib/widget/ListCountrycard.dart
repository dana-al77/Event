import 'package:flutter/material.dart';

import '../model/Countrymodel.dart';
import 'Countrycard.dart';




class ListCountrycard extends StatelessWidget {
  final List<Countrymodel> Country;
  ListCountrycard({super.key,required this.Country});

  @override
  Widget build(BuildContext context) {
    return  SizedBox (
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Country.length,
          itemBuilder: (context,index){
            return Countrycard(Country:Country[index]);
          }
      ),
    );
  }
}