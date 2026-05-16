import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/darwer/nav_bar.dart';
import '../widget/BottomNavigatorBar.dart';
import '../widget/DrawerWidget.dart';
import '../widget/ListCategorycard_builder.dart';
import '../widget/ListCountrycard_Builder.dart';
import '../widget/ListEventCard_builder.dart';
import '../widget/list_view_event_all_bilder.dart';






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
        title: Text("News ... ", style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [

            SliverToBoxAdapter(child:SizedBox(height: 15) ,),
            SliverToBoxAdapter(
              child: Text(
                " اختر مدينتك ",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(child:SizedBox(height: 15) ,),

            SliverToBoxAdapter(child: ListCountrycardBuilder()),
            SliverToBoxAdapter(child:SizedBox(height: 15) ,),
            SliverToBoxAdapter(
              child: Text(
                "اختر حفلتك ",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(child:SizedBox(height: 15) ,),
           SliverToBoxAdapter(child: ListCategorycardBuilder()),
            SliverToBoxAdapter(child: SizedBox(height: 18)),

           ListEventCardBuilderAll(

            ),

          ],
        ),
      ),
      drawer: Drawer(child:
      DrawerWidget()),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
