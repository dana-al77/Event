

import 'package:untitled11/components/servel.dart';

import '../Helper/api.dart';
import '../model/Evventmodel.dart';

class EventAllServicesCity{
  Future <List <EventByCityModel>> getAllEventbuCountry({required int id}) async {
    print("================EventServices============");
    try {
      var apiUrl = "${SERVERURL.serverURL}api/halls_by_cities/$id";

      List<dynamic> data = await Api().get(
          url: apiUrl);
      print("Data retrieved from API: $data");
      List<EventByCityModel> EventList = [];
      for (int i = 0; i < data.length; i++) {
        EventList.add(
          EventByCityModel.fromJson(data[i]),
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
