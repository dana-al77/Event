/*

import 'package:flutter/material.dart';



class NewSearchView extends StatefulWidget {
  const NewSearchView({super.key});

  @override
  State<NewSearchView> createState() => _NewSearchViewState();
}

class _NewSearchViewState extends State<NewSearchView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        elevation: 0.0,
      ),
      body: SearchListviewBuilder(),


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
      showSearch(context: context, delegate: SearchUser());
      break;
    case 1:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyCardview()));
      break;
    case 2:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SearchListviewBuilder()));
      break;
    case 3:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Categoryview()));
      break;
  }
}
 */
