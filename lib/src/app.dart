import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/themes.dart';
import 'package:home_kitchen_user_app/src/ui/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice UI',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
