import '../Helper/api.dart';
import '../components/servel.dart';
import '../model/Countrymodel.dart';
class CountryServices{
  Future <List <Countrymodel>> getCountry() async {
    print("================CountryServices============");
    try {
      var apiUrl = "${SERVERURL.serverURL}api/show_all_cities";
      List<dynamic> data = await Api().get(url: apiUrl);
      print("Data retrieved from API: $data");

      List<Countrymodel> CountryList = [];
      for (int i = 0; i < data.length; i++) {
        CountryList.add(
          Countrymodel.fromJson(data[i]),
        );
        print('$CountryList');
      }
      return CountryList;
    }
    catch (e) {
      // طباعة الاستثناء في حالة حدوث أي خطأ
      print("Error while fetching categories: $e");
      return [];
    }
    //////////////////////////////////////////////////////////////////////////////////////////شو حط بال catch
  }
}