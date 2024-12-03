import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }
  static setBool(String key, bool value) {
    _pref.setBool(key, value);
  }

  static getBool(String key) {
    return _pref.getBool(key) ?? false;
  }
}
