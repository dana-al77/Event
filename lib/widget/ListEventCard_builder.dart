

import 'package:flutter/material.dart';
import 'package:untitled11/pages/EventByCategory.dart';
import '../Error_Loading/getErrorUI.dart';
import '../Error_Loading/getLoadingUI.dart';

import '../Services/events_service_by_ategory.dart';
import '../model/Evventmodel.dart';
import '../model/event_by_category.dart';
import 'ListEventCard.dart';
import 'list_event_by_category_card.dart';

class ListEventCardBuilderByCategory extends StatefulWidget {

  const ListEventCardBuilderByCategory({super.key, required this.id});
  final String id;

  @override
  State<ListEventCardBuilderByCategory> createState() => _ListEventCardBuilderState();
}

class _ListEventCardBuilderState extends State<ListEventCardBuilderByCategory> {

  var future;
  @override
  void initState(){
    super.initState();
    var eventService = new EventAllServicesCategory();
    future = eventService.getAllHallsByCategory(id: widget.id);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventByCategorymodel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EventByCategorymodel> Events=snapshot.data!;
            return ListEventCardByCategory(Events:Events, );
          }else if(snapshot.hasError){
            return  SliverToBoxAdapter(
              child:  getErrorUI(error: "oops there was an error, try late"),
            );
          }

          else
          {
            return  SliverToBoxAdapter (child:getLoadingUI(),); }

        }
    );




  }
}
//////////////////////////////////////////////////////

