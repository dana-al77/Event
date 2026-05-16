/*



import 'package:flutter/cupertino.dart';
import 'package:untitled11/model/Categorymodel.dart';

import '../Repository/category_repository.dart';

class CategoryController extends ChangeNotifier {
  List<Categorymodel> categoryLists = <Categorymodel>[];
  var isloading = true;

  setLoading(bool loading) {
    isloading = loading;
    notifyListeners();
  }

  Future<Categorymodel?> getAllCategory() async {
    CategoryListModel? cate = await CategoryRepository.fetchAllCategories();
    if (cate != null) {
      categoryLists = cate.categories;
      setLoading(false);
    }
  }
}
 */
