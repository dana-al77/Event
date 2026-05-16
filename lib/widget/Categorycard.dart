
import 'package:flutter/material.dart';
import '../components/servel.dart';
import '../model/Categorymodel.dart';
import '../pages/EventByCategory.dart';

class Categorycard extends StatelessWidget {
  Categorycard({required this.categoryModel, super.key});

  final Categorymodel categoryModel;

  @override
  Widget build(BuildContext context) {

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EventByCategory(category: categoryModel.id.toString());
            }));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 110,
              width: 200,
              decoration:BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "${"${SERVERURL.serverURL}"}${categoryModel.imagePath!}",
                  ),

                ),
                borderRadius:   BorderRadius.circular(12),
              ),

              child: Center(
                child: Text(
                  categoryModel.name ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );


  }
}


