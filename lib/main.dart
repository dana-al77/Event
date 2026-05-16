import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled11/components/token.dart';
import 'package:untitled11/provider/data_provider.dart';
import 'pages/Categoryview.dart';
import 'package:untitled11/pages/Regestir_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled11/sharedPrefernce/shared_pref.dart';
late SharedPreferences sharedPref;
bool darkMode = false;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetWork.cacheInitialization();
  token=await CacheNetWork.getCacheData(key:'token');
  print('Token is $token');
  SharedPreferences.getInstance().then((instance){
    darkMode = instance.getBool("darkMode")!;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MultiProvider(providers:[
  ChangeNotifierProvider<ProviderData>(
  create:(context)=> ProviderData(),)
  ],
  child:DarkModeWithTheme(),
  );

  }
}

class DarkModeWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ProviderData>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:token != null &&  token != "" ? Categoryview() : RegestirScreen(),
      routes: {
        'regestir':(context) => RegestirScreen(),

      },
      theme: theme.getTheme(),

    );
  }

}
