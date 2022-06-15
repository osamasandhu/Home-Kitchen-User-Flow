import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/orders_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_text_field.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/decorated_colored_container_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/location_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/payment_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _promoCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Checkout'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getText(text: 'Delivery Address'),
            const SizedBox(height: 13),
            const LocationWidget(),
            _getText(text: 'Delivery Time'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 13, bottom: 6),
              padding: const EdgeInsets.only(left: 7, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 7.0,
                      top: 23,
                      bottom: 15,
                    ),
                    child: _getRow(title: 'Scheduled For', value: 'NOW'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0, bottom: 16),
                    child: _getRow(title: 'Prep Time', value: '15 Minutes'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0, bottom: 30),
                    child: _getRow(title: 'Delivery Time', value: '17 Minutes'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0, bottom: 35),
                    child: _getRow(
                      title: 'TOTAL:',
                      value: '32 Minutes',
                      valueTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 1,
                        color: AppColors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
            _getText(text: 'Promo Code'),
            AppTextField(
              boxConstraints: const BoxConstraints(maxHeight: 62),
              contentPadding: const EdgeInsets.all(20),
              textEditingController: _promoCode,
              hint: 'Promo Code',
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 75,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 10),
                child: DecoratedColoredContainerWidget(
                  widget:
                      Image.asset(AppAssets.promoIcon, width: 14, height: 18),
                ),
              ),
            ),
            const PaymentWidget(),
            AuthButton(
              text: 'Make Payment',
              onTap: () {
                AppNavigation.push(context, const OrdersPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRow({
    required String title,
    required String value,
    TextStyle? valueTextStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            letterSpacing: 1,
            color: AppColors.grey,
          ),
        ),
        Text(
          value,
          style: valueTextStyle ??
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 1,
                color: Color(0xFF393835),
              ),
        ),
      ],
    );
  }

  Widget _getText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 1,
        color: AppColors.green,
      ),
    );
  }
}
