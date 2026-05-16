import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/servel.dart';

import '../Services/my_booking_service.dart';
import '../model/my_booking_model.dart';
import 'package:http/http.dart' as http;
class MyCardWidget extends StatefulWidget {
  MyCardWidget({Key? key, required this.MyCart, required this.onCancellation}) : super(key: key);
  final MyBooking MyCart;
  final Function() onCancellation;

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  List<MyBooking> bookingList = [];

  @override
  void initState() {
    super.initState();
    fetchBookingList();
  }

  void fetchBookingList() async {
    try {
      List<MyBooking> fetchedList = await MyBookingServices.getMyReservation();
      setState(() {
        bookingList = fetchedList;
      });
    } catch (e) {
      print("Error fetching reservation list: $e");
    }
  }

  Future<void> cancelReservation(int reservationId) async {
    final url = Uri.parse('${SERVERURL.serverURL}api/Reservation/cancel/$reservationId');
    print('Request URL: $url');
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token = sharedPref.getString('token');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Cancellation successful: ${responseData['message']}');
        setState(() {
          bookingList.removeWhere((booking) => booking.id == reservationId);
        });
        widget.onCancellation(); // Trigger UI update
      } else {
        print('Failed to cancel reservation: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Details My reservation",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.MyCart.hall?.name ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.MyCart.hall?.location ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            r"$""${widget.MyCart.totalCost?.toString() ?? ''}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        "The chosen service",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      if (widget.MyCart.secondaryServices != null)
                        SingleChildScrollView(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3,
                            ),
                            itemCount: widget.MyCart.secondaryServices!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Text(
                                  widget.MyCart.secondaryServices![index].name ?? '',
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await cancelReservation(widget.MyCart.id);
              widget.onCancellation() ;
            },
            style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: Colors.purpleAccent[100],
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
