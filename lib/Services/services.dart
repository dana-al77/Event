

import '../Helper/api.dart';
import '../components/servel.dart';
import '../model/services_model.dart';

class Services{
  Future <List <ServicesModel>> getTypeServices({required int id}) async {
    print("================Services============");
    try {
      var apiUrl = "${SERVERURL.serverURL}api/ShowService/$id";
      print("API URL: $apiUrl");
      List<dynamic> data = await Api().get(url: apiUrl);

      List<ServicesModel> TypeServicesList = [];
      for (int i = 0; i < data.length; i++) {
        TypeServicesList.add(
          ServicesModel.fromJson(data[i]),
        );
        print("$TypeServicesList");
      }
      return TypeServicesList;
    }catch(e){
      print("Error while fetching services: $e");
      return[];
    }
    //////////////////////////////////////////////////////////////////////////////////////////شو حط بال catch
  }
}