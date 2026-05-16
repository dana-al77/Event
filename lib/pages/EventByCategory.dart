

import 'package:flutter/material.dart';

import '../widget/CustomTextFeild.dart';
import '../widget/ListEventCard_builder.dart';


class EventByCategory extends StatelessWidget {
  const EventByCategory({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(" halls by category ... ", style: TextStyle(color: Colors.purpleAccent),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
         /*   SliverToBoxAdapter(child: CustomTextFieldd(),),*/
            SliverToBoxAdapter(child: SizedBox(height:18),),
            ListEventCardBuilderByCategory(id: category,),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

