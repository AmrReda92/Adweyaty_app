import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  static late SharedPreferences _prefs ;
  static init()async{
    _prefs =await SharedPreferences.getInstance();
  }

  static const _keyIsLoggedIn ="is_logged_in";
  static const _keyUid= "user_uid";

  static Future<void> saveLogin(String uid)async{
    await _prefs.setBool(_keyIsLoggedIn, true);
    await _prefs.setString(_keyUid, uid);
  }

  static bool isLoggedIn (){
    return _prefs.getBool(_keyIsLoggedIn)?? false;
  }

  static String? getUid (){
    return _prefs.getString(_keyUid);
  }

  static Future<void> clear() async {
    await _prefs.remove(_keyIsLoggedIn);
    await _prefs.remove(_keyUid);
  }

}

