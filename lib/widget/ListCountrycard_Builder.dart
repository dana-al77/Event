import 'package:flutter/material.dart';

import '../Services/CountryServices.dart';
import '../model/Countrymodel.dart';
import 'ListCountrycard.dart';


class ListCountrycardBuilder extends StatefulWidget {
  const ListCountrycardBuilder({super.key});

  @override
  State<ListCountrycardBuilder> createState() => _ListCountrycardBuilderState();
}

class _ListCountrycardBuilderState extends State<ListCountrycardBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Countrymodel>>(
        future: CountryServices().getCountry(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Countrymodel> Country=snapshot.data!;
            return ListCountrycard(Country:Country);
          }else if(snapshot.hasError){
            return SliverToBoxAdapter(
              child: Text("oops there was an error, try late"),
            );
          }
          else{
            return Center( child: CircularProgressIndicator(),);
          }
        });
  }
}