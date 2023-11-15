import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_login_app/constants/app_const.dart';
import 'package:riverpod_login_app/interface/screens/home/model/model_user.dart';

class ServiceUsers {
  ServiceUsers._();
  static ServiceUsers get shared => ServiceUsers._();

  Future<ModelUser> getUsers() async {
    final response = await http.get(Uri.parse("${AppConsts.shared.baseURL}${AppConsts.shared.users}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return ModelUser.fromJson(data);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
