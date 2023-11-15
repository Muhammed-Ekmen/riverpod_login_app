// view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_app/interface/screens/home/controller/home_controller.dart';
import 'package:riverpod_login_app/interface/screens/home/model/model_user.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: _appBar(context), body: _body(context));

  Consumer _body(BuildContext context) => Consumer(
        builder: (context, watch, child) {
          final users = watch.watch(userCtrlProvider);
          return users.when(data: _onData, error: _onError, loading: _onLoading);
        },
      );

  _appBar(BuildContext context) => AppBar(
        backgroundColor: Colors.black,
        title: const Text('Riverpod API Example'),
        leading: _exitIcon(context),
      );

  _exitIcon(BuildContext context) => IconButton(
        onPressed: () => HomeCtrl.shared.exitButtonOnTap(context),
        icon: const Icon(Icons.exit_to_app),
      );
}

//MARK: OnData
extension OnData on HomeView {
  Widget _onData(ModelUser data) => ListView.builder(
        itemCount: data.data?.length ?? 0,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: const Icon(Icons.people, color: Colors.black),
            title: Text("User ${data.data?[index].email}"),
          ),
        ),
      );
}

//MARK: OnError
extension OnError on HomeView {
  Widget _onError(error, stackTrace) => Center(child: Text('Error fetching posts $error'));
}

//MARK: OnLoading
extension OnLoading on HomeView {
  Widget _onLoading() => const Center(child: CircularProgressIndicator());
}
