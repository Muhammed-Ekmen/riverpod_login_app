// auth_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/screens/login/model/model_login.dart';
import 'package:riverpod_login_app/service/service_login.dart';
import 'package:riverpod_login_app/storage/app_storage.dart';

String email = "";
String password = "";

final loginCtrlProvider = Provider<LoginCtrl>((ref) {
  return LoginCtrl();
});

class LoginCtrl {
  static LoginCtrl get shared => LoginCtrl();

  Future<void> router(BuildContext context) async {
    String? token = await AppStorage.shared.read(key: AppStorageKeys.token);
    if (token != null) Navigator.pushNamed(context, '/home');
  }

  Future<ModelLogin> loginUser({required String email, required String password}) async {
    try {
      ModelLogin response = await ServiceLogin.shared.login(email: email, password: password);
      return response;
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      return ModelLogin(errorMessage: e.toString());
    }
  }

  Future<void> loginButtonOnTap(BuildContext context, LoginCtrl loginCtrl) async {
    if (email != "" && password != "") {
      final ModelLogin model = await loginCtrl.loginUser(email: email, password: password);
      if (model.token != null) {
        await AppStorage.shared.save(key: AppStorageKeys.token, value: model.token!);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/home');
      } else {
        // Show error message for failed login
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Error ${model.errorMessage}"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email And Password Can Not Be Empty")));
    }
  }
}
