class ModelLogin {
  String? token;
  String? errorMessage;

  ModelLogin({this.token, this.errorMessage});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
