/*
import 'package:flutter/material.dart';
import '../widget/ListCategorycard_builder.dart';
import '../widget/ListEventCard_builder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class Categoryview extends StatefulWidget {
  const Categoryview({super.key});

  @override
  State<Categoryview> createState() => _CategoryviewState();
}

class _CategoryviewState extends State<Categoryview> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,

        centerTitle: true,
        title:const Text("News ... ", style: TextStyle(color: Colors.white),),
      ),
      body:const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: ListCategorycardBuilder()),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
            /*ListEventCardBuilder(
              category: "general",
            ),*/
          ],
        ),
      ),
      drawer: Drawer(

      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.purpleAccent,
        backgroundColor: Colors.white,
        height: 60,
        animationDuration: Duration(microseconds: 200),
        index: selectedIndex,
        items:const [
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
   //   showSearch(context: context, delegate: SearchUser());

      break;
    case 1:
    //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCardview()));
      break;
    case 2:
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NewSearchView()));
      break;
    case 3:
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categoryview()));
      break;
  }

}
 */