import 'dart:convert';

import 'package:http/http.dart' as http;

/*

class SearchFetch{
  var data =[];
  List<Searchmodel> results =[];
  String fetchurl ="";
  Future<List<Searchmodel>> getSearchlist({String? query})async{
    var url = Uri.parse(fetchurl);
    http.Response response = await http.get(url);
    try{
      if(response.statusCode==200){
        data= json.decode(response.body);
        results =data.map((e) => Searchmodel.fromJson(e)).toList();
        if (query !=null){
          results = results.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
        }

      }else{
        print("Api error");
      }
    }on Exception catch (e){
      print("error:$e");
    }
    return results;
  }
}*/