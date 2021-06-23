import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements LocalStorageInterface {
  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is ThemeMode) {
      shared.setString(key, value.toString());
    }
  }
}
