import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/widgets/button/regular_button.dart';
import 'package:riverpod_login_app/interface/widgets/textFormField/regular_text_field.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_title, _formFields(context), _loginButton],
          ),
        ),
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

  get _emailTextFormField => const RegularTextField(
        hintText: " Please Enter The Email",
        icon: Icons.mail,
      );

  _placeHolder(BuildContext context) => SizedBox(height: MediaQuery.sizeOf(context).height / 50);

  get _passwordTextFormField => const RegularTextField(
        hintText: " Please Etner The Password",
        icon: Icons.password,
      );
}

//MARK: Login Button
extension LoginViewLoginButton on LoginView {
  get _loginButton => RegularButton(onPressed: () {}, label: "Login");
}
