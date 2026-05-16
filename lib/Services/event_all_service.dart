

import 'package:untitled11/components/servel.dart';

import '../Helper/api.dart';

import '../model/event_all_halls.dart';

class EventAllHallsServices{
  Future <List <EventAllHallsModel>> getAllEvent() async {
    print("================EventServices============");
    try {
      var apiUrl = "${SERVERURL.serverURL}api/show_all_halls";
  print("$apiUrl");
      List<dynamic> data = await Api().get(
          url: apiUrl);
      print("Event========== retrieved from Event All service===========: $data");
      List<EventAllHallsModel> EventList = [];
      for (int i = 0; i < data.length; i++) {
        EventList.add(
          EventAllHallsModel.fromJson(data[i]),
        );
        print("$EventList");
      }
      return EventList;
    } catch(e){
      // طباعة الاستثناء في حالة حدوث أي خطأ
      print("Error while fetching categories: $e");
      return [];
    }
  }
}

