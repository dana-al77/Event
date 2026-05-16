import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Searchmodel.dart';


class SearchListview extends StatelessWidget {
  final List<Searchmodel> Searches;
  const SearchListview({super.key, required this.Searches});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: Searches.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(
                      Searches[index].name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        SizedBox(height: 7), // إضافة مسافة بين العناصر
                        Text(
                        Searches[index].location!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ]),
                    trailing: Text(
                        '${Searches[index].price} \$'.toString(),
                      style: TextStyle(
                        color: Colors.purple.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              /*      leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        Searches[index].image!,
                        width: 100,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),*/
                  ),
                  Divider(color: Colors.purpleAccent,),
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}