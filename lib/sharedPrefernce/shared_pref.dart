import 'package:shared_preferences/shared_preferences.dart';

class CacheNetWork{
  static late SharedPreferences sharedPref;
  static Future cacheInitialization() async{
    sharedPref=await SharedPreferences.getInstance();
}
/////////////// set - get - delete - clear(key,value)
  static Future<bool> insertToCache({required String key,required String value})async{
    return await sharedPref.setString(key, value) ;
  }

  static String getCacheData({required String key}){
    return  sharedPref.getString(key) ?? "" ;
  }
  static Future<bool> deletCacheItem({required String key})async{
    return await sharedPref.remove(key) ;
  }
}