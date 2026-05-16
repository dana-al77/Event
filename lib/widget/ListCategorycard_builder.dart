
import 'package:flutter/material.dart';
import '../Repository/category_repository.dart';
import '../Services/CategoryServices.dart';
import '../model/Categorymodel.dart';
import '../provider/category.dart';
import 'ListCategorycard.dart';
import 'package:provider/provider.dart';

class ListCategorycardBuilder extends StatefulWidget {
  const ListCategorycardBuilder({Key? key}) : super(key: key);

  @override
  State<ListCategorycardBuilder> createState() => _ListCategorycardBuilderState();
}

class _ListCategorycardBuilderState extends State<ListCategorycardBuilder> {
 var _categoryListFuture;
  @override
  void initState() {
    super.initState();
    _categoryListFuture = CategoryServices.getCategory(); // الحصول على قائمة الفئات عند بدء التطبيق
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Categorymodel>>(
      future:_categoryListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListCategorycard(Categories: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text("Oops, there was an error: ${snapshot.error}"),
          );
        } else {
          return Center(child: Text("No data available"));
        }
      },
    );
  }
}


