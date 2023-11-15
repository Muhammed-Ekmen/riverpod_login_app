import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._();
  static AppStorage get shared => AppStorage._();

  Future<bool> save({required AppStorageKeys key, required String value}) async {
    try {
      final storageInstance = await SharedPreferences.getInstance();
      bool response = await storageInstance.setString(key.name, value);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<String?> read({required AppStorageKeys key}) async {
    final storageInstance = await SharedPreferences.getInstance();
    return storageInstance.getString(key.name);
  }

  Future<bool> delete({required AppStorageKeys key}) async {
    final storageInstance = await SharedPreferences.getInstance();
    return storageInstance.remove(key.name);
  }
}

enum AppStorageKeys { token }
