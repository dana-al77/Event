import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/servel.dart';
import 'dart:convert';

import '../model/favourite_model.dart';

class FavoriteEventsPage extends StatefulWidget {
  @override
  _FavoriteEventsPageState createState() => _FavoriteEventsPageState();
}

class _FavoriteEventsPageState extends State<FavoriteEventsPage> {
  List<FavouriteModel> favoriteEvents = [];

  @override
  void initState() {
    super.initState();
    fetchFavoriteEvents();
  }

  Future<void> fetchFavoriteEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIds = prefs.getStringList('favorites');
    if (favoriteIds != null && favoriteIds.isNotEmpty) {
      print('FavoriteIds is not null and is not empty');
      try {
        final client = http.Client();
        final token = prefs.getString('token');
        final response = await client.get(
          Uri.parse('${SERVERURL.serverURL}api/favorite'), // تأكد من تعديل الرابط حسب API الخاص بك
          headers: {
            "Authorization": "Bearer $token",
          },
        );
        print('=======================================');

        final jsonData = json.decode(response.body);
        print(jsonData);
        print('helllloooooooo');
        setState(() {
          print('object');
          favoriteEvents = (jsonData['data'] as List)
              .map((eventData) => FavouriteModel.fromJson(eventData))
              .toList();
          print('favoriteEvents============');
        });
      } catch (e) {
        print('Error fetching favorite events: $e');
      }
    } else {
      print('User has no favorite events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Events'),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: ListView.builder(
        itemCount: favoriteEvents.length,
        itemBuilder: (context, index) {
          final event = favoriteEvents[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 7,
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                     child: Image.network(
                       "${"${SERVERURL.serverURL}"}${event.imagePath?? ''}",
                       height: 250,
                       width: double.infinity,
                       fit: BoxFit.cover,
                     ),
                    ),
                    Container(
                      height: 250,
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.purple.withOpacity(0),
                            Colors.purple.withOpacity(0.8),
                          ],
                          stops: [0.6, 1],
                        ),
                      ),
                      child: Text(
                       event.name!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Toggle favorite status
                            if (favoriteEvents.contains(event)) {
                              favoriteEvents.remove(event);
                            } else {
                              favoriteEvents.add(event);
                            }
                          });
                        },
                        icon: Icon(
                          favoriteEvents.contains(event)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteEvents.contains(event)
                              ? Colors.red
                              : null,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city, color: Colors.purple,),
                          SizedBox(width: 6,),
                          Text(event.location!,),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.purpleAccent,),
                          SizedBox(width: 6,),
                          Text(event.capacity!,),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Icon(Icons.price_check, color: Colors.purpleAccent,),
                      //     SizedBox(width: 6,),
                      //     Text(r"$""${event.price}"),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
