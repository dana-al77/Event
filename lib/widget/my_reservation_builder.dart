import 'package:flutter/material.dart';
import '../Services/my_booking_service.dart';
import '../model/my_booking_model.dart';
import 'my_reservation_list.dart';


class MyCardWidgetBuilder extends StatefulWidget {
  const MyCardWidgetBuilder({super.key});

  @override
  State<MyCardWidgetBuilder> createState() => _MyCardWidgetBuilderState();
}

class _MyCardWidgetBuilderState extends State<MyCardWidgetBuilder> {
  var _categoryListFuture;

  @override
  void initState() {
    super.initState();
    _categoryListFuture = MyBookingServices.getMyReservation(); // الحصول على قائمة الفئات عند بدء التطبيق
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyBooking>>(
        future: _categoryListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MyBooking> MyCart=snapshot.data!;
            return ListMyCard(MyCart:MyCart);
          }else if(snapshot.hasError){
            return SliverToBoxAdapter(
              child: Text("oops there was an error, try late"),
            );
          }
          else{
            return Center( child: CircularProgressIndicator(),);
          }
        });
  }
}