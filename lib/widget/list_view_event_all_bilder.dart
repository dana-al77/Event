
import 'package:flutter/material.dart';
import 'package:untitled11/model/event_all_halls.dart';
import '../Error_Loading/getErrorUI.dart';
import '../Error_Loading/getLoadingUI.dart';
import '../Services/event_all_service.dart';

import 'list_event_card_all.dart';

class ListEventCardBuilderAll extends StatefulWidget {

  const ListEventCardBuilderAll({super.key,});


  @override
  State<ListEventCardBuilderAll> createState() => _ListEventCardBuilderAllState();
}

class _ListEventCardBuilderAllState extends State<ListEventCardBuilderAll> {

  var future;
  @override
  void initState(){
    super.initState();
    future = EventAllHallsServices().getAllEvent();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventAllHallsModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EventAllHallsModel> Events=snapshot.data!;
            return ListEventCardAllHAlls(Events:Events, );
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
