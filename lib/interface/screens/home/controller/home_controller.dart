// controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/screens/home/model/model_user.dart';
import 'package:riverpod_login_app/service/service_users.dart';
import 'package:riverpod_login_app/storage/app_storage.dart';

final userCtrlProvider = FutureProvider<ModelUser>(
  (ref) async {
    return await ServiceUsers.shared.getUsers();
  },
);

class HomeCtrl {
  static HomeCtrl get shared => HomeCtrl();

  Future<void> exitButtonOnTap(BuildContext context) async {
    bool response = await AppStorage.shared.delete(key: AppStorageKeys.token);
    if (response == true) Navigator.pushNamed(context, "/");
  }
}
