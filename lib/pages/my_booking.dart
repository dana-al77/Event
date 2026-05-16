
import 'package:flutter/material.dart';

import '../Widget/DrawerWidget.dart';
import '../widget/BottomNavigatorBar.dart';
import '../widget/grident_appBar.dart';
import '../widget/my_reservation_builder.dart';


class MyCardview extends StatefulWidget {
  const MyCardview({super.key});

  @override
  State<MyCardview> createState() => _MyCardviewState();
}

class _MyCardviewState extends State<MyCardview> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: 'My Reservation',),
      body: MyCardWidgetBuilder(),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}