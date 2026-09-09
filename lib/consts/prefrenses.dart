import 'package:shared_preferences/shared_preferences.dart';

class Prefrenses {
  
  static const String appObordingKey = 'appObordingKey';
  static Future<void> onbording(String key, var value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setBool(key, value);
 
  }


  static Future<bool> isOnboardingCompleted() async {
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(appObordingKey) ?? false;
  }
}
