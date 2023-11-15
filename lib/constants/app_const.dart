class AppConsts {
  //SINGLETON USAGE
  AppConsts._();
  static AppConsts get shared => AppConsts._();

  final String baseURL = "https://reqres.in/api/";
  final String login = 'login';
}
