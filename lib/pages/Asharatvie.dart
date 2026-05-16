import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Categoryview.dart';


class Asharatview extends StatefulWidget {
  @override
  _AsharatviewState createState() => _AsharatviewState();
}

class _AsharatviewState extends State<Asharatview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text("News ... ", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.purpleAccent,
        backgroundColor: Colors.white,
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        index: selectedIndex,
        items: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search_sharp, size: 40, color:Colors.white ),
              Text('search', style: TextStyle(fontSize: 12,color:Colors.black)) // labelText
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.notifications, size: 40,  color:Colors.white),
              Text('Notifications', style: TextStyle(fontSize: 12,color:Colors.black)) // labelText
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.shopping_cart, size: 40,   color:Colors.white),
              Text('Cart', style: TextStyle(fontSize: 12,color:Colors.black)) // labelText
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.home, size: 40,  color:Colors.white),
              Text('Home', style: TextStyle(fontSize: 12,color:Colors.black)) // labelText
            ],
          ),
        ],
        onTap: (index) {

          setState(() {
            selectedIndex = index;
            _onItemTapped(context, index);
          });
        },


      ),
    );
  }
}
void _onItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      //showSearch(context: context, delegate: SearchUser());

      break;
    case 1:
    //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCardview()));
      break;
    case 2:
     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NewSearchView()));
      break;
    case 3:
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categoryview()));
      break;
  }
}