import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref
{
  
  setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  } 

  setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String strValue =prefs.getString(key) ?? "no";
    return strValue;
  } 

  getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(key) ?? false;
    return boolValue;
  }

}