import 'package:flutter/material.dart';

import '../model/my_booking_model.dart';
import '../pages/my_booking_ui.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListMyCard extends StatefulWidget {
  const ListMyCard({Key? key, required this.MyCart});
  final List<MyBooking> MyCart;

  @override
  State<ListMyCard> createState() => _ListMyCardState();
}

class _ListMyCardState extends State<ListMyCard> {
  List<int> cancelledBookingIds = [];

  @override
  void initState() {
    super.initState();
    _loadCancelledBookings();
  }

  // تحميل الحجوزات الملغاة من SharedPreferences
  Future<void> _loadCancelledBookings() async {
    final prefs = await SharedPreferences.getInstance();
    final cancelledIds = prefs.getStringList('cancelledBookingIds') ?? [];
    setState(() {
      cancelledBookingIds = cancelledIds.map((id) => int.parse(id)).toList();
    });
  }

  // حفظ الحجوزات الملغاة في SharedPreferences
  Future<void> _saveCancelledBookings() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cancelledIds = cancelledBookingIds.map((id) => id.toString()).toList();
    await prefs.setStringList('cancelledBookingIds', cancelledIds);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.MyCart.length,
      itemBuilder: (context, index) {
        final booking = widget.MyCart[index];

        // تحقق مما إذا كانت الحجز ملغى
        final isCancelled = cancelledBookingIds.contains(booking.id);

        // تجاهل الحجوزات الملغاة
        if (isCancelled) {
          return SizedBox.shrink();
        }

        return MyCardWidget(
          MyCart: booking,
          onCancellation: () {
            setState(() {
              // إضافة معرف الحجز للقائمة الملغاة
              cancelledBookingIds.add(booking.id);
              // حفظ الحجوزات الملغاة في SharedPreferences
              _saveCancelledBookings();
            });
          },
        );
      },
    );
  }
}

