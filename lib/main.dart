import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_login_app/interface/screens/home/view/home_view.dart';
import 'package:riverpod_login_app/interface/screens/login/view/login_view.dart';

final Logger logger = Logger();

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        routes: {
          '/': (context) => LoginView(),
          '/home': (context) => const HomeView(),
        },
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
      );
}
