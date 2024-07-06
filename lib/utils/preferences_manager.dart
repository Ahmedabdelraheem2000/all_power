
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hire_me/model/auth/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager extends GetxService{
  static late SharedPreferences _sharedPreferences;

  Future<PreferencesManager> initial() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static dynamic getAppData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveAppData(
      {required key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
  }

  static Future<bool> saveUserToken(
      {required key, required String token}) async {
    return await _sharedPreferences.setString(key, token);
  }

  static dynamic getUserToken({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<dynamic> saveUserData(
      {required String key, required User user}) async {
    return await _sharedPreferences.setString(key, jsonEncode(user));
  }

  static User getUserData({required String key}) {
    User user = User();
    String? userDataJson = _sharedPreferences.getString(key);
    if (userDataJson != null)
      user = User.fromJson(jsonDecode(userDataJson));
    return user;
  }

  static Future<bool> clearData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
  }
}