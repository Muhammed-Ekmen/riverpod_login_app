import 'package:riverpod_login_app/constants/app_const.dart';
import 'package:riverpod_login_app/interface/screens/login/model/model_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpod_login_app/main.dart';

class ServiceLogin {
  //SINGETON USAGE
  ServiceLogin._();
  static ServiceLogin get shared => ServiceLogin._();

  //Login Request
  Future<ModelLogin> login({required String email, required String password}) async {
    final apiUrl = Uri.parse("${AppConsts.shared.baseURL}${AppConsts.shared.login}");
    try {
      final response = await http.post(apiUrl, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        return ModelLogin.fromJson(jsonResponse);
      } else {
        throw Exception("ServiceLogin Error");
      }
    } catch (e) {
      logger.e("Service Login Error $e");
      throw Exception("ServiceLogin Error");
    }
  }
}
