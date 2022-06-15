import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/home_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_logo_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/location_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Sign-Up'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: AppLogoWidget()),
            const TitleTextWidget(title: 'Full Name'),
            AppTextField(
              textEditingController: _fullNameController,
              hint: 'Full Name',
            ),
            const TitleTextWidget(title: 'Email'),
            AppTextField(
              textEditingController: _emailController,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const TitleTextWidget(title: 'Contact Number'),
            AppTextField(
              textEditingController: _contactController,
              hint: 'Contact Number',
              keyboardType: TextInputType.number,
            ),
            const TitleTextWidget(title: 'Password'),
            AppTextField(
              textEditingController: _passwordController,
              hint: 'Password',
              obscure: true,
            ),
            const TitleTextWidget(title: 'Confirm Password'),
            AppTextField(
              textEditingController: _confirmPasswordController,
              hint: 'Password',
              obscure: true,
            ),
            const TitleTextWidget(title: 'Delivery Address'),
            const LocationWidget(),
            AuthButton(
              text: 'SIGN-UP',
              onTap: () {
                AppNavigation.pushReplacement(context, const HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
