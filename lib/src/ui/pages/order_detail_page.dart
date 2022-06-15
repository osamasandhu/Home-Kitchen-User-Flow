import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/location_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final _preparationTimeController = TextEditingController(text: '15 Minutes');
  final _deliveryTimeController = TextEditingController(text: '15 Minutes');
  final _addOnsController = TextEditingController(
    text: 'Extra Lamb, Extra Sauce',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Order #54'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppAssets.orderDetailImage,
                  height: 198,
                  width: 210,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 73.0, bottom: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stewed Lamb - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      letterSpacing: 1,
                      color: AppColors.green,
                    ),
                  ),
                  Text(
                    '£8.00',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const TitleTextWidget(title: 'Prep Time'),
            AppTextField(textEditingController: _preparationTimeController),
            const TitleTextWidget(title: 'Delivery Time'),
            AppTextField(textEditingController: _deliveryTimeController),
            const TitleTextWidget(title: 'Add-Ons'),
            AppTextField(textEditingController: _addOnsController),
            LocationWidget(iconColor: AppColors.orange),
            AuthButton(text: 'Cancel Order', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
