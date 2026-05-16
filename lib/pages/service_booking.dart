
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/components/servel.dart';
import 'package:untitled11/pages/secondary_service_builder.dart';
import 'package:untitled11/pages/service_list_builder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:untitled11/pages/wallet.dart';

class ServicesBooking extends StatefulWidget {
ServicesBooking({Key? key, required this.id, required this.hallId}) : super(key: key);
final int id;
final int hallId;

@override
State<ServicesBooking> createState() => _ServicesBookingState();
}

class _ServicesBookingState extends State<ServicesBooking> {
DateTime dateTime = DateTime(2023, 07, 28, 7, 30);
bool showList = false;
late int selectedId = -1;
late DateTime dateTimeColor;
int numberOfHours = 0;
List<String> selectedServices = [];

@override
void initState() {
super.initState();
dateTime = DateTime.now();
}

void _onSelectedServicesChanged(List<String> services) {
setState(() {
selectedServices = services;
});
}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(12.0),
child: CustomScrollView(
physics: BouncingScrollPhysics(),
slivers: [
SliverToBoxAdapter(child: SizedBox(height: 10)),
SliverToBoxAdapter(
child: Text(
"Choose services for your Event!",
style: TextStyle(
color: Colors.purpleAccent[200],
fontSize: 20,
fontFamily: 'Angkor',
),
),
),
SliverToBoxAdapter(child: SizedBox(height: 10)),
SliverToBoxAdapter(
child: ListTypeServicesBuilder(
id: widget.id,
onServiceSelected: (serviceId) {
setState(() {
showList = true;
selectedId = serviceId;
});
},
),
),
SliverToBoxAdapter(child: SizedBox(height: 22)),
SliverToBoxAdapter(
child: showList
? CheckBoxListBuilder(
id: selectedId,
onSelectedServicesChanged: _onSelectedServicesChanged,
)
    : Center(child: Container(child: Center(child: Text("")))),
),
SliverToBoxAdapter(child: SizedBox(height: 40)),
SliverToBoxAdapter(
child: Row(
children: [
ElevatedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]!),
minimumSize: MaterialStateProperty.all<Size>(Size(0, 40)),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
),
),
onPressed: () async {
DateTime? newDate = await showDatePicker(
context: context,
initialDate: dateTime,
firstDate: DateTime(2000),
lastDate: DateTime(2100),
builder: (BuildContext context, Widget? child) {
return Theme(
data: ThemeData.light().copyWith(
colorScheme: ColorScheme.light().copyWith(
primary: Colors.purpleAccent[100],
),
),
child: child!,
);
},
);
if (newDate == null) return;
TimeOfDay? newTime = await showTimePicker(
context: context,
initialTime: TimeOfDay(


hour: dateTime.hour,


minute: dateTime.minute,
),
builder: (BuildContext context, Widget? child) {
return Theme(
data: ThemeData.light().copyWith(
colorScheme: ColorScheme.light().copyWith(
primary: Colors.purpleAccent[100],
),
),
child: child!,
);
},
);
if (newTime == null) return;
final newDateTime = DateTime(
newDate.year,
newDate.month,
newDate.day,
newTime.hour,
newTime.minute,
);

setState(() {
dateTime = newDateTime;
});
},
child: Container(
child: Text(
"Select date & time",
style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
),
),
),
SizedBox(width: 50),
Text(
"${dateTime.day}/${dateTime.month}/${dateTime.year}  -  ${dateTime.hour}:${dateTime.minute}",
style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold),
),
],
),
),
SliverToBoxAdapter(child: SizedBox(height: 10)),
SliverToBoxAdapter(
child: Row(
children: [
Container(
height: 40,
width: 200,
decoration: BoxDecoration(
color: Colors.grey[300],
borderRadius: BorderRadius.circular(12),
),
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Text(
"The duration of the event",
style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
),
),
),
SizedBox(width: 30),
Expanded(
flex: 50,
child: Padding(
padding: EdgeInsets.symmetric(horizontal: 10),
child: Container(
height: 40,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
border: Border.all(color: Colors.purpleAccent),
),
child: TextField(
keyboardType: TextInputType.number,
textAlign: TextAlign.center,
onChanged: (value) {
setState(() {
numberOfHours = int.parse(value);
});
},
decoration: InputDecoration(
border: InputBorder.none,
hintText: " ساعات الحفلة",
hintStyle: TextStyle(color: Colors.grey),
contentPadding: EdgeInsets.zero,
isCollapsed: true,
counterText: "",
suffixIcon: SizedBox(
width: 100,
child: Icon(Icons.access_alarm),
),
),
),
),
),
),
],
),
),
SliverToBoxAdapter(child: SizedBox(height: 40)),
SliverToBoxAdapter(
child: SizedBox(
width: double.infinity,
child: ElevatedButton(


onPressed: () async {


// بيانات الحجز
Map<String, dynamic> requestData = {
"hall_id": widget.hallId.toString(),
"start_time": DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime),
"count_hours": numberOfHours.toString(),
"secondary_services": selectedServices, // تحويل البيانات إلى صفيف JSON
};
print(numberOfHours);
print(dateTime);
print(selectedServices);
// عنوان URL لطلب الحجز
Uri url = Uri.parse('${SERVERURL.serverURL}api/Reservation/store');
print("==============================================================================================");
// إرسال البيانات
SharedPreferences sharedPref = await SharedPreferences.getInstance();
String? token = sharedPref.getString('token');
var response = await http.post(
url,
body: jsonEncode(requestData), // تحويل البيانات إلى JSON هنا
headers: {
"Content-Type": "application/json", // تعيين رأس الطلب Content-Type إلى application/json
"Authorization": "Bearer $token"
},
);
  var js=jsonDecode(response.body);
print(response.statusCode);
// التحقق من رمز الاستجابة
  if (js['message'] == 'Reservation created successfully') {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking',style: TextStyle(color: Colors.black,
              fontSize: 17,fontFamily: 'Angkor')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              Text('Reservation created successfully.and your bill',style: TextStyle(color: Colors.grey,
                  fontSize: 17),),

              Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text('\$${js['reservation']['total_cost']}',style: TextStyle(color: Colors.purpleAccent,
                    fontSize: 17),),
              ),
        ]  ),
          actions: <Widget>[
            TextButton(
              child: Text('ok',style: TextStyle(color: Colors.purpleAccent[100],
                  fontFamily: 'Angkor'
              ),),
              onPressed: () {
                //////////////////////////////// بدنا نروح عالحجوزاتي
                Navigator.of(context).pop(); // إغلاق مربع الحوار دون فعل أي شيء
              },
            ),

          ],
        );
      },
    );
    print('Response: ${response.body}');
  } else if (js['message'] == 'Sorry, you do not have enough funds in your wallet.') {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Booking',style: TextStyle(color: Colors.black,
            fontSize: 17,fontFamily: 'Angkor')),
        content:Column(
          mainAxisSize: MainAxisSize.min,
          children:[ Text('Sorry, you do not have enough founds in your wallet.and your bill ',style: TextStyle(color: Colors.grey,
              fontSize: 17),),
            Text(' \$${js['total_cost']}',style: TextStyle(color: Colors.purpleAccent,
                fontSize: 17,fontWeight: FontWeight.bold),),
       ] ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel',style: TextStyle(color: Colors.purpleAccent[100],
                fontFamily: 'Angkor'
            ),),
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق مربع الحوار دون فعل أي شيء
            },
          ),
          TextButton(
            child: Text('Deposit',style: TextStyle(
                color: Colors.purpleAccent[100],
                fontFamily: 'Angkor'
            ),),
            onPressed: () async {

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => WalletScreen(),
              ));
            },
          ),
        ],
      );
    },
  );
print('Response: ${response.body}');
} else {
// حدث خطأ ما
print('An error occurred');
print('Response: ${response.body}');
}
},
style: ButtonStyle(
elevation: MaterialStateProperty.all<double>(30),
backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
minimumSize: MaterialStateProperty.all<Size>(Size(50, 50)),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
),
child: Text(
'Booking Confirmation',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: 'Angkor',
),
),
),
),
),
],
),
);
}
}