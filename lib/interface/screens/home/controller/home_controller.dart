// controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_login_app/constants/app_const.dart';
import 'dart:convert';

import 'package:riverpod_login_app/interface/screens/home/model/model_user.dart';

final userCtrlProvider = FutureProvider<ModelUser>(
  (ref) async {
    final response = await http.get(Uri.parse("${AppConsts.shared.baseURL}${AppConsts.shared.users}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return ModelUser.fromJson(data);
    } else {
      throw Exception('Failed to load posts');
    }
  },
);
