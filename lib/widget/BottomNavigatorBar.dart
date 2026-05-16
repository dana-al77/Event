import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../pages/Asharatvie.dart';
import '../pages/Categoryview.dart';
import '../pages/Search.dart';
import '../pages/my_booking.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.purpleAccent,
      backgroundColor: Colors.white,
      height: 60,
      animationDuration: Duration(microseconds: 200),
      index: selectedIndex,
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.search_sharp, size: 40, color: Colors.white),
            Text('search', style: TextStyle(fontSize: 12, color: Colors.black)) // labelText
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.notifications, size: 40, color: Colors.white),
            Text('Notifications', style: TextStyle(fontSize: 12, color: Colors.black)) // labelText
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.shopping_cart, size: 40, color: Colors.white),
            Text('Cart', style: TextStyle(fontSize: 12, color: Colors.black)) // labelText
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.home, size: 40, color: Colors.white),
            Text('Home', style: TextStyle(fontSize: 12, color: Colors.black)) // labelText
          ],
        ),
      ],

      onTap: (index) {
        setState(() {
          selectedIndex = index;
          _onItemTapped(context, index);
        });
      },
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
       showSearch(context: context, delegate: SearchUser());
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Asharatview()));
        break;
      case 2:
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCardview()));
        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categoryview()));
        break;
    }
  }
}