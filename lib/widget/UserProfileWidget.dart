
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:untitled11/widget/update_profile.dart';




class UserProfileWidget extends StatefulWidget {
  final Map<String, dynamic> userData;

  UserProfileWidget({required this.userData});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  @override
  void initState() {
    super.initState();
    // استدعاء وظيفة لتحميل بيانات المستخدم عند تهيئة الحالة الأولية للصفحة
    loadUserData();
  }

  Future<void> loadUserData() async {
    print("=========hhh==============");
    // استخدام Shared Preferences لتحميل بيانات المستخدم
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // تحميل قيم بيانات المستخدم من التخزين المحلي
      userName = prefs.getString('name') ?? '';
      userEmail = prefs.getString('email') ?? '';
      userPhone = prefs.getString('phone') ?? '';
    });
    print(userName);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 70, // تعيين نصف قطر الـ CircleAvatar
            backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.97PVxtoaX8fu136XwTJwIwHaEV?rs=1&pid=ImgDetMain"),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 70,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
             color: Colors.grey[200]
             ),
              padding: EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(Icons.person,color: Colors.purpleAccent[100],size: 35,), // الأيقونة التي تختارها
                  SizedBox(width: 50), // تباعد بين الأيقونة والنص
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                    Text("name",style: TextStyle(fontSize: 20,color:Colors.black,

                    ),),
                    Text(
                      userName, // افتراض أن الاسم متوفر في بيانات المستخدم
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey),
                    ),
                  ]),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]
              ),
              padding: EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(Icons.email_outlined,color: Colors.purpleAccent[100],size: 35,), // الأيقونة التي تختارها
                  SizedBox(width: 50), // تباعد بين الأيقونة والنص
                  Column(
                    mainAxisSize: MainAxisSize.min,
                      children:[
                        Padding(

                          padding: EdgeInsets.only(right: 130),
                          child: Text("Email",style: TextStyle(fontSize: 20,color:Colors.black,

                          ),),
                        ),
                        Text(
                          userEmail, // افتراض أن الاسم متوفر في بيانات المستخدم
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 70,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]
              ),
              padding: EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Icon(Icons.phone,color: Colors.purpleAccent[100],size: 35,), // الأيقونة التي تختارها
                  SizedBox(width: 50), // تباعد بين الأيقونة والنص
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Padding(

                          padding: EdgeInsets.only(right: 170),
                          child: Text("phone",style: TextStyle(fontSize: 20,color:Colors.black,

                          ),),
                        ),
                        Padding(
                          padding:EdgeInsets.only(right: 100),
                          child: Text(
                            userPhone, // افتراض أن الاسم متوفر في بيانات المستخدم
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          // يمكنك إضافة المزيد من تفاصيل المستخدم إذا كنت تريد
          TextButton (
            onPressed: () {
              // اكتب هنا الشيء الذي تريد فعله عند الضغط على الزر
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return UpdateProfile(data: widget.userData,);
              },));
            },
            child:Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(color: Colors.purpleAccent[100],
                  borderRadius:BorderRadius.circular(12) ),
                child: Center(
                  child: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                  fontFamily: 'Angkor',fontSize: 22),),
                )
            ),
          )

        ],

      ),

    );
  }
}










/*
 GestureDetector(
            onTap: () async {
              final picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.gallery );

              if (pickedFile != null) {
                File avatarFile = File(pickedFile.path);
                setState(() {
                  // قم بتحديث صورة المستخدم بالصورة التي تم اختيارها
                  widget.userData['avatar'] = avatarFile;
                });
              }

            },
            child: CircleAvatar(
              radius: 50,
              child: widget.userData['avatar'] != null
                  ? Image.file(widget.userData['avatar'])
                  : Icon(Icons.person),
            ),
          ),
 */

/*
 CircleAvatar(
            radius: 50,
            // استخدام صورة المستخدم إذا كانت متوفرة
            child: userData['avatar'] != null
                ? Image.network(userData['avatar'])
                :Image.network('https://th.bing.com/th/id/OIP.97PVxtoaX8fu136XwTJwIwHaEV?rs=1&pid=ImgDetMain',
            height: 690,width: 200,)
          ),
 */