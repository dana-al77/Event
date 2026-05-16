
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http ;
import '../components/servel.dart';
import '../model/Evventmodel.dart';
import '../pages/details_hall_city.dart';


class EventCardByCity extends StatefulWidget {
  EventCardByCity({ required this.Event,super.key});
  EventByCityModel Event;

  @override
  State<EventCardByCity> createState() => _EventCardByCityState();
}

class _EventCardByCityState extends State<EventCardByCity> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();

  }

  Future<void> checkIfFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final eventId = widget.Event.id.toString();
    setState(() {
      isFavorite = prefs.getStringList('favorites')?.contains(eventId) ?? false;
    });
  }

  Future<void> toggleFavorite() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString('token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final eventId = widget.Event.id.toString();
    String url;
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (isFavorite) {
      url = '${SERVERURL.serverURL}api/remove/favorites/$eventId';
      var response = await http.delete(Uri.parse(url),headers:{
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        favorites.remove(eventId);
      } else {
        print('Failed to remove favorite event');
      }
    } else {
      url = '${SERVERURL.serverURL}api/add/favorite/$eventId';
      var response = await http.post(Uri.parse(url),headers:{
        "Authorization": "Bearer $token"
      } );
      if (response.statusCode == 200) {
        favorites.add(eventId);
        print(response.body.toString());
      } else {
        print('Failed to add favorite event');
      }
    }
    prefs.setStringList('favorites', favorites);
    setState(() {
      isFavorite = !isFavorite;
    });
    print('Updated favorites list: $favorites');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsHallByCity(Event: widget.Event,);
        }));
      },
      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
          elevation: 7,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(borderRadius:
                BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),),
                  child: Image.network(
                    "${"${SERVERURL.serverURL}"}${widget.Event.imagsPath!}"
                  ,height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
                        colors:[
                          Colors.purple.withOpacity(0),
                          Colors.purple.withOpacity(0.8),
                        ] ,
                        stops: [0.6,1],
                      )
                  ),
                  child:    Text(widget.Event.name!,
                    style: TextStyle(color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],


              ),
              Padding(padding: EdgeInsets.all(15),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.place,color: Colors.purpleAccent,),
                        SizedBox(width: 6,),
                        Text(widget.Event.location!,),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.person,color: Colors.purpleAccent,),
                        SizedBox(width: 6,),
                        Text(widget.Event.capacity!,),
                      ],
                    ),


                  ],
                ),) ],
          ),

        ),
    );
    // )
  }
}