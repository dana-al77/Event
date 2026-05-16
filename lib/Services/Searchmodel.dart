import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled11/components/servel.dart';
import '../model/Searchmodel.dart';

class SearchFetch {

  List<Searchmodel> results = [];

  String fetchurl = "${SERVERURL.serverURL}api/search";

  Future<List<Searchmodel>> getSearchlist({String? query}) async {
    try {
      var url = Uri.parse(fetchurl);
      print("$url");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
  print("$jsonResponse");

        if (jsonResponse.containsKey('results')) {

          var searchResults = jsonResponse['results'] as List<dynamic>;

          results = searchResults.map((e) => Searchmodel.fromJson(e)).toList();

          if (query != null && query.isNotEmpty) {
            print("=================SSSSSSerch=======================");
            results = results.where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
                element.location.toLowerCase().contains(query.toLowerCase()) ||
                element.cityId.toString().toLowerCase().contains(query.toLowerCase())
            ).toList();
            print("===================================");
            results.forEach((element) {
              print("Location: ${element.location}");
            });

            print("results");
            print("$results");
          }
        } else {
          print('No results key found in the response.');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
    return results;
  }
}
