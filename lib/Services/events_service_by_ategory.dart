
import 'package:untitled11/components/servel.dart';
import 'package:untitled11/model/event_by_category.dart';

import '../Helper/api.dart';


class EventAllServicesCategory{
  Future <List <EventByCategorymodel>> getAllHallsByCategory({required String id}) async {
    print("================EventServices by category============");
    try {
      var apiUrl = "${SERVERURL.serverURL}api/halls_by_eventType/$id";
      List<dynamic> data = await Api().get(
          url: apiUrl);

      List<EventByCategorymodel> EventList = [];
      for (int i = 0; i < data.length; i++) {
        EventList.add(
          EventByCategorymodel.fromJson(data[i]),
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

