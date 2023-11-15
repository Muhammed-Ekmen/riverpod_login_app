import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/screens/login/controller/login_controller.dart';
import 'package:riverpod_login_app/interface/screens/login/model/model_login.dart';
import 'package:riverpod_login_app/interface/widgets/button/regular_button.dart';
import 'package:riverpod_login_app/interface/widgets/textFormField/regular_text_field.dart';
import 'package:riverpod_login_app/main.dart';

// ignore: must_be_immutable
class LoginView extends ConsumerWidget {
  LoginView({super.key});
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginCtrl loginCtrl = ref.watch(loginCtrlProvider);
    return SafeArea(child: Scaffold(backgroundColor: Colors.black, body: _body(context, loginCtrl)));
  }

  Column _body(BuildContext context, LoginCtrl loginCtrl) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_title, _formFields(context), _loginButton(loginCtrl)],
      );
}

//MARK: Title
extension LoginViewTitleField on LoginView {
  get _title => const FittedBox(
        child: Text(
          "Welcome Back\nTo Login",
          style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
}

//MARK: Email And Password Text Form Field
extension LoginViewEmailField on LoginView {
  _formFields(BuildContext context) => Column(
        children: [
          _emailTextFormField,
          _placeHolder(context),
          _passwordTextFormField,
        ],
      );

  get _emailTextFormField => RegularTextField(
        hintText: " Please Enter The Email",
        icon: Icons.mail,
        onChanged: (String value) {
          email = value;
        },
      );

  _placeHolder(BuildContext context) => SizedBox(height: MediaQuery.sizeOf(context).height / 50);

  get _passwordTextFormField => RegularTextField(
        hintText: " Please Etner The Password",
        icon: Icons.password,
        onChanged: (String value) {
          password = value;
        },
      );
}

//MARK: Login Button
extension LoginButton on LoginView {
  RegularButton _loginButton(LoginCtrl loginCtrl) {
    return RegularButton(
      onPressed: () async {
        final ModelLogin model = await loginCtrl.loginUser(email: email, password: password);
        if (model.token != null) {
          // Successful login, navigate to next screen
          logger.i("check token ${model.token}");
        } else {
          // Show error message for failed login
          logger.i("check error message ${model.errorMessage}");
        }
      },
      label: "Login",
    );
  }
}
