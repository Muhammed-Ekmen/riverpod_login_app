import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._();
  static AppStorage get shared => AppStorage._();

  late SharedPreferences storageInstance;

  Future<void> init() async {
    storageInstance = await SharedPreferences.getInstance();
  }
  

  Future<bool> save({required AppStorageKeys key, required String value}) async {
    try {
      bool response = await storageInstance.setString(key.name, value);
      return response;
    } catch (e) {
      return false;
    }
  }

  String? read({required AppStorageKeys key}) {
    return storageInstance.getString(key.name);
  }
}

enum AppStorageKeys { token }
