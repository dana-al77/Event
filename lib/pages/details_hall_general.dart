
import 'package:flutter/material.dart';
import 'package:untitled11/pages/service_booking.dart';

import '../components/servel.dart';
import '../model/event_all_halls.dart';


class DetailsHallGeneral extends StatefulWidget {
  DetailsHallGeneral({ required this.Event,super.key});
  EventAllHallsModel Event;
@override
State<DetailsHallGeneral> createState() => _DetailsEventState();
}

class _DetailsEventState extends State<DetailsHallGeneral> {



@override
Widget build(BuildContext context) {
return Scaffold(
body:SingleChildScrollView(
child: Card(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// صورة مع BorderRadius
ClipRRect(
borderRadius: BorderRadius.circular(14.0),
child: Image.network( "${"${SERVERURL.serverURL}"}${widget.Event.images!}"
,
height: 315,
width: double.infinity,
fit: BoxFit.cover,
),
),
Padding(
padding: const EdgeInsets.all(16.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
// عنوان الصورة
Text(
widget.Event.name!,
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
color: Colors.black
),
),
Container(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // إضافة مسافة داخلية
decoration: BoxDecoration(
color: Colors.grey[300],
borderRadius: BorderRadius.circular(16),
),
child: Center( // توسيط النص
child: Text(
"${widget.Event.price}\$",
style: const TextStyle(
fontSize: 20,
color: Colors.purpleAccent,
),
),
),
),
],
),

),
Row(
children: [
Icon(Icons.location_on,color: Colors.purpleAccent,),
Text("  Hall Location:"
,
style: const TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
color: Colors.grey, // يمكنك تغيير اللون حسب الحاجة
),
),
SizedBox(width: 13,),
Container(
height: 40, // تحديد ارتفاع الزر
width: 130, // تحديد عرض الزر
padding: const EdgeInsets.all(8.0), // إضافة مسافة داخلية
decoration: BoxDecoration(
color: Colors.purpleAccent, // تحديد لون الخلفية
borderRadius: BorderRadius.circular(10), // تحديد تقريب الزوايا
boxShadow: [ // تحديد الظل لإنشاء تأثير الارتفاع
BoxShadow(
color: Colors.purpleAccent.withOpacity(0.5),
spreadRadius: 2,
blurRadius: 5,
offset: Offset(0, 3), // changes position of shadow
),
],
),
child: Center( // توسيط النص
child: Text(
widget.Event.location!,
style: const TextStyle(
fontSize: 16,
color: Colors.black, // يمكنك تغيير لون النص حسب الحاجة
),
),
),
),
],
),
SizedBox(height: 17,),
Row(
children: [
Icon(Icons.reduce_capacity,color: Colors.purpleAccent,),
Text("  Hall Capacity:"
,
style: const TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
color: Colors.grey, // يمكنك تغيير اللون حسب الحاجة
),
),

SizedBox(width: 13,),
Container(
height: 40, // تحديد ارتفاع الزر
width: 130, // تحديد عرض الزر
padding: const EdgeInsets.all(8.0), // إضافة مسافة داخلية
decoration: BoxDecoration(
color: Colors.purpleAccent, // تحديد لون الخلفية
borderRadius: BorderRadius.circular(10), // تحديد تقريب الزوايا
boxShadow: [ // تحديد الظل لإنشاء تأثير الارتفاع
BoxShadow(
color: Colors.purpleAccent.withOpacity(0.5),
spreadRadius: 2,
blurRadius: 5,
offset: Offset(0, 3), // changes position of shadow
),
],
),
child: Center( // توسيط النص
child: Text(
widget.Event.capacity!,
style: const TextStyle(
fontSize: 16,
color: Colors.black, // يمكنك تغيير لون النص حسب الحاجة
),
),
),
),
],
),
SizedBox(height: 15,),
Container(
margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
child: Text("  desciption",style: TextStyle(color: Colors.purpleAccent,
fontFamily: 'Angkor',

fontSize: 17,),),
),
Center(
child: Container(
decoration:BoxDecoration(
color: Colors.white,
border: Border.all(color: Colors.grey,),
borderRadius: BorderRadius.circular(16),

),
height:100,
width: 340,
padding: EdgeInsets.all(10),
margin: EdgeInsets.symmetric(horizontal: 15),
child:ListView.builder(
itemCount:1,
itemBuilder: (ctx,index) => Card(
elevation: 0.5,
child: Padding(
padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10,),
child: Text(widget.Event.description!),
),
),
)
),
),


SizedBox(height: 20,),
SizedBox(
width: double.infinity, // توسيع الزر ليأخذ عرض الشاشة
child:ElevatedButton(
onPressed: () {
showModalBottomSheet(
context: context,
isScrollControlled: true, // يسمح بتمرير الواجهة عندما يكون ارتفاعها كبيرًا
builder: (BuildContext context) {
return FractionallySizedBox(
heightFactor: 0.84, // الارتفاع يساوي ثلاثة أرباع ارتفاع الشاشة
child: Container(
color: Colors.white,
child: ServicesBooking(id:widget.Event.event_type_id!, hallId: widget.Event.id!,

  ),
),
);
},
);
},
style: ButtonStyle(
elevation: MaterialStateProperty.all<double>(30),
backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
),
child: Text(
'Booking',
style: TextStyle(
fontSize: 18,
fontFamily: 'Angkor',
color: Colors.white,
),
),
),
),

],
),
),
),
);
}
}



/*

import 'package:flutter/material.dart';
import '../components/servel.dart';
import '../model/event_all_halls.dart';


class DetailsHallGeneral extends StatelessWidget {
  DetailsHallGeneral({ required this.Event,super.key});
  EventAllHallsModel Event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة مع BorderRadius
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image.network(
                  "${"${SERVERURL.serverURL}"}${Event.images!}"
                  ,
                  height: 315,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ), Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
// عنوان الصورة
                    Text(
                      Event.name!,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // إضافة مسافة داخلية
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center( // توسيط النص
                        child: Text(
                          "${Event.price}\$",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Row(
                children: [
                  Icon(Icons.location_on,color: Colors.purpleAccent,),
                  Text("  Hall Location:"
                    ,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey, // يمكنك تغيير اللون حسب الحاجة
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    height: 40, // تحديد ارتفاع الزر
                    width: 130, // تحديد عرض الزر
                    padding: const EdgeInsets.all(8.0), // إضافة مسافة داخلية
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent, // تحديد لون الخلفية
                      borderRadius: BorderRadius.circular(10), // تحديد تقريب الزوايا
                      boxShadow: [ // تحديد الظل لإنشاء تأثير الارتفاع
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center( // توسيط النص
                      child: Text(
                        Event.location!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // يمكنك تغيير لون النص حسب الحاجة
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.reduce_capacity,color: Colors.purpleAccent,),
                  Text("  Hall Capacity:"
                    ,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey, // يمكنك تغيير اللون حسب الحاجة
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    height: 40, // تحديد ارتفاع الزر


                    width: 130, // تحديد عرض الزر
                    padding: const EdgeInsets.all(8.0), // إضافة مسافة داخلية
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent, // تحديد لون الخلفية
                      borderRadius: BorderRadius.circular(10), // تحديد تقريب الزوايا
                      boxShadow: [ // تحديد الظل لإنشاء تأثير الارتفاع
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center( // توسيط النص
                      child: Text(
                        "${Event.capacity} Persone",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // يمكنك تغيير لون النص حسب الحاجة
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                alignment: Alignment.topRight,
                child: Text("Description",style: TextStyle(color: Colors.purpleAccent,

                  fontSize: 17,),),
              ),
              Center(
                child: Container(
                    decoration:BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey,),
                      borderRadius: BorderRadius.circular(16),

                    ),
                    height:100,
                    width: 340,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child:ListView.builder(
                      itemCount:1,
                      itemBuilder: (ctx,index) => Card(
                        elevation: 0.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10,),
                          child: Text(Event.description!),
                        ),
                      ),
                    )
                ),
              ),


              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity, // توسيع الزر ليأخذ عرض الشاشة
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 2000,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "ggggggggggggggggggg",
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(30),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: Text(
                    'Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
 */