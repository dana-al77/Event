import 'package:flutter/material.dart';

import '../widget/CustomTextFeild.dart';
import '../widget/ListEventCard_builder.dart';
import '../widget/list_events_buildr_counntry.dart';


class EventByCountry extends StatelessWidget {
  const EventByCountry({super.key, required this.category});
  final int category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("hii halss by country... ", style: TextStyle(color: Colors.purpleAccent),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            /*SliverToBoxAdapter(child: CustomTextFieldd(),),*/
            SliverToBoxAdapter(child: SizedBox(height:18),),
            ListEventCardBuilderbyCity(id: category,),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}