import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/location_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

import '../widgets/auth_button_widet.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({Key? key}) : super(key: key);

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _contactController;
  late TextEditingController _updatePasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _fullNameController = TextEditingController(text: 'Syndee Panda');
    _emailController = TextEditingController(text: 'synpan@gmail.com');
    _contactController = TextEditingController(text: '+44 **** ******');
    _updatePasswordController = TextEditingController(text: '*******');
    _confirmPasswordController = TextEditingController(text: '*******');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 86,
                width: 86,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.profileImage),
                  ),
                ),
                padding: const EdgeInsets.only(left: 72),
                margin: const EdgeInsets.only(bottom: 46),
                alignment: Alignment.bottomRight,
                child: Icon(Icons.edit_outlined, color: AppColors.orange),
              ),
            ),
            const TitleTextWidget(title: 'Full Name'),
            AppTextField(textEditingController: _fullNameController),
            const TitleTextWidget(title: 'Email'),
            AppTextField(
              textEditingController: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const TitleTextWidget(title: 'Contact Number'),
            AppTextField(
              textEditingController: _contactController,
              keyboardType: TextInputType.number,
            ),
            const TitleTextWidget(title: 'Update Password'),
            AppTextField(
              textEditingController: _updatePasswordController,
              obscure: true,
            ),
            const TitleTextWidget(title: 'Confirm Password'),
            AppTextField(
              textEditingController: _confirmPasswordController,
              obscure: true,
            ),
            LocationWidget(iconColor: AppColors.orange),
            AuthButton(
              text: 'UPDATE PROFILE',
              onTap: () {
                AppNavigation.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
