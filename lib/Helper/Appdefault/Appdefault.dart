
import '../ExportFile/Export.dart';

class AppDefault {
  static final shared = AppDefault();

  Future<void> SaveToken(String value) async {
    await MySharedPreferences.saveString('token', value);
  }

  Future<String> getToken() async {
    var value = await MySharedPreferences.getString("token") ?? '';
    return value;
  }

  Future<void> clear() async {
     await MySharedPreferences.clearAll();
  }

   Future<void> saveModel<T>(String key, T value) async {
    await MySharedPreferences.saveModel(key, value);
  }

  Future<T?> getModel<T>(String key, T Function(Map<String, dynamic> json) fromJson) async {
    return await MySharedPreferences.getModel<T>(key, fromJson) ?? null;
  }
}







