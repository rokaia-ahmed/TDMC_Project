import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  /// OBJECT FROM PACKAGE
  static late SharedPreferences sharedPreferences;

  /// GET INSTANCE FROM SHARED PREFERENCES
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

  }

  /// SAVE DATA IN CACHE
  static Future<bool> saveData(String key, dynamic value) async {
    switch (value.runtimeType) {
      case String:
        return await sharedPreferences.setString(key, value);
      case int:
        return await sharedPreferences.setInt(key, value);
      case bool:
        return await sharedPreferences.setBool(key, value);
      case double:
        return await sharedPreferences.setDouble(key, value);
      default:
        return false;
    }
  }

  /// GET DATA FROM CACHE
  static dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  /// REMOVE DATA FROM CACHE BY KEY
  static Future<bool> removeData(String key) async {
    return await sharedPreferences.remove(key);
  }

  /*/// SAVE DATA IN CACHE
  static Future<bool> saveMapData(Map<String, dynamic> data) async {
    try {
      data.forEach((key, value) async {
        switch (value.runtimeType) {
          case String:
            await sharedPreferences.setString(key, value);
            break;
          case int:
            await sharedPreferences.setInt(key, value);
            break;
          case bool:
            await sharedPreferences.setBool(key, value);
            break;
          case double:
            await sharedPreferences.setDouble(key, value);
            break;
          default:
            break;
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }*/
}
