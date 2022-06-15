import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.appLogo,
      width: 93,
      height: 119,
      fit: BoxFit.fill,
    );
  }
}
