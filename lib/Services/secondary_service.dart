
import 'dart:convert';

import '../Helper/api.dart';
import '../components/servel.dart';
import '../model/secondary_service.dart';

class SecondaryServices{
  Future <List <SecondaryServiceModel>> getCheckBoxServices({ int? id}) async {
    print("================Secondary Services============");
    var apiUrl = "${SERVERURL.serverURL}api/get_secondrary_service/$id";
    print("API URL: $apiUrl");

    try {
      List<dynamic> data = await Api().get(url: apiUrl);

      List<SecondaryServiceModel> CheckBoxList = [];
      for (int i = 0; i < data.length; i++) {
        CheckBoxList.add(
          SecondaryServiceModel.fromJson(data[i]),
        );
      }
      print(data);
      return CheckBoxList;
    }catch(e){
      print("Error while fetching secondary services: $e");
      return[];
    }
    //////////////////////////////////////////////////////////////////////////////////////////شو حط بال catch
  }
}