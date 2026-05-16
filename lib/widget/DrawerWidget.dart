import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/pages/home_page.dart';


import '../pages/favorite_hall_general.dart';
import '../pages/profile_builder.dart';
import '../pages/wallet.dart';
import '../provider/data_provider.dart';
import 'UserProfileWidget.dart';




class DrawerWidget extends StatefulWidget {
const DrawerWidget({super.key});

@override
State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
bool _darkMode = false;

@override
void initState() {
super.initState();
// استرجاع قيمة darkMode من SharedPreferences عند بدء التطبيق
_loadDarkMode();
}

// تعريف التابع لاسترجاع قيمة darkMode من SharedPreferences
void _loadDarkMode() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
setState(() {
_darkMode = prefs.getBool("darkMode") ?? false;
});
}

@override
Widget build(BuildContext context) {
return ListView(
children: [
DrawerHeader(
decoration: BoxDecoration(
gradient: LinearGradient(colors: [
Colors.purple,
Colors.deepPurple,
]),
),
child: CircleAvatar(
radius: 50, // تعيين نصف قطر الـ CircleAvatar
backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.97PVxtoaX8fu136XwTJwIwHaEV?rs=1&pid=ImgDetMain"),
),
),
Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("User Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:Icon(
Icons.person,
color: Colors.purple,
size: 30,
) ,
trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder:(context){
return UserProfileScreen();
},),);
},
),
////////////2
),
Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("Favourite Events",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:Icon(
Icons.favorite,
color: Colors.purple,
size: 30,
) ,
trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: (){
  Navigator.of(context).push(MaterialPageRoute(builder:(context){
    return FavoriteEventsPage();
 },),);
},
),

),
//////////////3
Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("Notifications",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:Icon(
Icons.notifications_none ,
color: Colors.red,
size: 30,
) ,
trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: (){
// Navigator.of(context).push(MaterialPageRoute(builder:(context){
//   return MyProfileCard();
//  },),);
},
),

),
//////////////4
Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("Dark Mode",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:
_darkMode? const Icon(Icons.dark_mode, color: Colors.purpleAccent, size: 30) :const Icon(Icons.light_mode, color: Colors.purpleAccent, size: 20),

trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: () async {
SharedPreferences prefs = await SharedPreferences.getInstance();
// تبديل قيمة darkMode بين true و false
bool newDarkMode = !_darkMode;
// تحديث قيمة darkMode في SharedPreferences
await prefs.setBool("darkMode", newDarkMode);
setState(() {
_darkMode = newDarkMode;
});
// تحديث الثيم المستخدم في التطبيق
Provider.of<ProviderData>(context, listen: false).setTheme(
newDarkMode ? ThemeData.dark() : ThemeData.light(),
);
},
),

),

Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("language",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:Icon(
Icons.language,
color: Colors.purpleAccent,
size: 30,
) ,
trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: (){
//   Navigator.of(context).push(MaterialPageRoute(builder:(context){
//    return MyProfileCard();
//   },),);
},
),

),
////////// wallet


  Padding(
    padding: EdgeInsets.all(8.0),
    child: ListTile(
      title: Text("wallet",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      ),
      leading:Icon(
        Icons.wallet,
        color: Colors.purpleAccent,
        size: 30,
      ) ,
      trailing: Icon(Icons.arrow_right,
        color: Colors.purple,
        size: 27,),
      onTap: (){
   Navigator.of(context).push(MaterialPageRoute(builder:(context){
    return WalletScreen();
  },),);
      },
    ),

  ),




////////////5
Padding(
padding: EdgeInsets.all(8.0),
child: ListTile(
title: Text("Sign Out",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
),
leading:Icon(
Icons.logout,
color: Colors.red,
size: 30,
) ,
trailing: Icon(Icons.arrow_right,
color: Colors.purple,
size: 27,),
onTap: (){
   Navigator.of(context).push(MaterialPageRoute(builder:(context){
   return LogOut();
  },),);
},
),


),
],
);
}}
