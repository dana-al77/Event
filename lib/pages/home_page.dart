import 'package:flutter/material.dart';
import 'package:untitled11/sharedPrefernce/shared_pref.dart';

import '../main.dart';
import '../widget/grident_appBar.dart';
import 'Regestir_screen.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: 'Logout Your Account'),
      body: Center(
        child: GestureDetector (
          onTap: () async {
            // عرض مربع حوار للتأكيد من رغبة المستخدم في تسجيل الخروج
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Logout Confirmation',style: TextStyle(color: Colors.black,
                      fontSize: 17,fontFamily: 'Angkor')),
                  content: Text('Are you sure you want to logout?',style: TextStyle(color: Colors.grey,
                  fontSize: 17),),
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
                      child: Text('Logout',style: TextStyle(
                          color: Colors.purpleAccent[100],
                          fontFamily: 'Angkor'
                      ),),
                      onPressed: () async {
                        // قم بحذف رمز الوصول (token)
                        await CacheNetWork.deletCacheItem(key: 'token');
                        // انتقل إلى شاشة تسجيل الدخول بعد تسجيل الخروج
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegestirScreen(),
                        ));
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            constraints: BoxConstraints.expand(width: 300, height: 50), // تحديد الحجم بشكل صريح
            decoration: BoxDecoration(
              color: Colors.purpleAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            clipBehavior: Clip.none, // هذا يمنع العناصر داخل الحاوية من التجاوز خارج حدودها
            child: Center(
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontFamily: 'Angkor', fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
