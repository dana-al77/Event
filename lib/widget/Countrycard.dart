import 'package:flutter/material.dart';
import '../components/servel.dart';
import '../model/Countrymodel.dart';
import '../pages/ EventByCategory.dart';

class Countrycard extends StatelessWidget {
  Countrycard({required this.Country,super.key});
  final Countrymodel Country;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder:(context){
          return EventByCountry(category: Country.id);
        },),);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 26),

        child: Container(
          height:110,
          width: 200,
          /////////////////////////////////////رابط صورة////////////////
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage( "${"${SERVERURL.serverURL}"}${Country.imagePath!}",
              ),),
            borderRadius: BorderRadius.circular(12),),
          child: Center(
            child: Text(Country.name!,
              style: TextStyle(color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

        ),
      ),
    );
  }
}