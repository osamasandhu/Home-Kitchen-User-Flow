import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/home_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_logo_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';

import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: AppLogoWidget()),
            const TitleTextWidget(title: 'Email'),
            AppTextField(
              textEditingController: _emailController,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              bottom: 32,
            ),
            const TitleTextWidget(title: 'Password'),
            AppTextField(
              textEditingController: _passwordController,
              hint: 'Password',
              obscure: true,
            ),
            AuthButton(
              text: 'LOGIN',
              onTap: () {
                AppNavigation.pushReplacement(context, const HomePage());
              },
            ),
            const SizedBox(height: 9),
            AuthButton(
              text: 'SIGN-UP',
              onTap: () {
                AppNavigation.push(context, const SignUpPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
