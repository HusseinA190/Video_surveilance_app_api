import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
   static late SharedPreferences sharesPref;
  static  Future cacheInitialization() async {
    sharesPref =  await SharedPreferences.getInstance();
  }
    static Future<bool> insertToCache({ required String key , required String value}) async {
      return await sharesPref.setString(key, value);

  }
   static Future<bool> insertToCacheList({ required String key , required List<String> value}) async {
     return await sharesPref.setStringList(key, value);


   }
   static String getCacheData({required String key}){
    return sharesPref.getString(key) ?? "";

  }
   static List<String> getCacheDataList({required String key}){
     return sharesPref.getStringList(key) ?? [];

   }
    static Future<bool> deleteCacheItem({required String key}) async {
    return await sharesPref.remove(key);
  }
}
