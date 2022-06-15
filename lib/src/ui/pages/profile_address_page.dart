import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';

class ProfileAddressPage extends StatefulWidget {
  const ProfileAddressPage({Key? key}) : super(key: key);

  @override
  State<ProfileAddressPage> createState() => _ProfileAddressPageState();
}

class _ProfileAddressPageState extends State<ProfileAddressPage> {
  late TextEditingController _fullNameController;
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();

  @override
  void initState() {
    _fullNameController = TextEditingController(text: 'Syndee Panda');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Address'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 59),
            const TitleTextWidget(title: 'Full Name'),
            AppTextField(
              textEditingController: _fullNameController,
              hint: 'Enter Full Name',
            ),
            const TitleTextWidget(title: 'Street'),
            AppTextField(
              textEditingController: _streetController,
              hint: 'Enter Street',
            ),
            const TitleTextWidget(title: 'City'),
            AppTextField(
              textEditingController: _cityController,
              hint: 'Enter City',
            ),
            const TitleTextWidget(title: 'Postcode'),
            AppTextField(
              textEditingController: _postCodeController,
              hint: 'Enter Postcode',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: AuthButton(
          text: 'SAVE ADDRESS',
          onTap: () {
            AppNavigation.pop(context);
          },
        ),
      ),
    );
  }
}
