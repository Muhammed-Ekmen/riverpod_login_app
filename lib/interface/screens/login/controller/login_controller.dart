// auth_controller.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/screens/login/model/model_login.dart';
import 'package:riverpod_login_app/service/service_login.dart';

final loginCtrlProvider = Provider<LoginCtrl>((ref) {
  return LoginCtrl();
});

class LoginCtrl {
  Future<ModelLogin> loginUser({required String email, required String password}) async {
    try {
      ModelLogin response = await ServiceLogin.shared.login(email: email, password: password);
      return response;
    } catch (e, stk) {
      debugPrintStack(stackTrace: stk);
      return ModelLogin(errorMessage: e.toString());
    }
  }
}
