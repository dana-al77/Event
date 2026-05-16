
import 'package:flutter/material.dart';
import '../Error_Loading/getErrorUI.dart';
import '../Error_Loading/getLoadingUI.dart';
import '../Services/EventAllServices.dart';
import '../model/Evventmodel.dart';
import 'ListEventCard.dart';

class ListEventCardBuilderbyCity extends StatefulWidget {

  const ListEventCardBuilderbyCity({super.key, required this.id});
  final int id;

  @override
  State<ListEventCardBuilderbyCity> createState() => _ListEventCardBuilderbyCityState();
}

class _ListEventCardBuilderbyCityState extends State<ListEventCardBuilderbyCity> {

  var future;
  @override
  void initState(){
    super.initState();
    var eventService = new EventAllServicesCity();
    future = eventService.getAllEventbuCountry(id: widget.id);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventByCityModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EventByCityModel> Events=snapshot.data!;
            return ListEventCardByCity(Events:Events, );
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