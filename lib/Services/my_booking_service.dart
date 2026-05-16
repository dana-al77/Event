import 'package:untitled11/Helper/api_reservation.dart';
import 'package:untitled11/components/servel.dart';
import 'package:untitled11/model/my_booking_model.dart';
import '../Helper/api.dart';

class MyBookingServices {
  static Future<List<MyBooking>> getMyReservation() async {
    print("================ReservationServices============");
    try {
      // استدعاء الطلب API بشكل منفصل
      var apiUrl = "${SERVERURL.serverURL}api/getUserReservations";
      print("API URL: $apiUrl");

      List<dynamic> data = await ApiReservation().get(url: apiUrl);
      print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      print("Data retrieved from API: $data");

      // تحويل البيانات إلى كائنات MyBooking
      List<MyBooking> bookingList = [];
      for (int i = 0; i < data.length; i++) {
        bookingList.add(MyBooking.fromJson(data[i]));
        print("$bookingList");
      }
      return bookingList;
    } catch (e) {
      // طباعة الاستثناء في حالة حدوث أي خطأ
      print("Error while fetching your reservation: $e");
      return [];
    }
  }
}
