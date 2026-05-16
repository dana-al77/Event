import 'package:flutter/material.dart';


import '../Services/Searchmodel.dart';
import '../model/Searchmodel.dart';
import '../widget/SearchListView.dart';

class SearchUser extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  SearchFetch _Searchmodel = SearchFetch();
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Searchmodel>>(
      future: _Searchmodel.getSearchlist(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          List<Searchmodel> searches = snapshot.data!;
          if (searches.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "No results found for  \"$query\"",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent,
                        fontFamily: 'Angkor'
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );

          } else {
            return SearchListview( Searches: searches,);
          }
        } else if (snapshot.hasError) {
          return Center(child: Text("Oops! There was an error, try later."));
        } else {
          return Center(child: Text("No data available."));
        }
      },
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Searchmodel>>(
      future: _Searchmodel.getSearchlist(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          List<Searchmodel> searches = snapshot.data!;
          return SearchListview( Searches: searches,);
        } else if (snapshot.hasError) {
          return Center(child: Text("Oops! There was an error, try later."));
        } else {
          return Center(child: Text("No data available."));
        }
      },
    );
  }

}
