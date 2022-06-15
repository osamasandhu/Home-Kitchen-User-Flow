import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/check_out_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/cart_tile_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/payment_widget.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Cart', displayLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 14),
                itemBuilder: (ctx, index) => const CartTileWidget(),
                itemCount: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 9.0, top: 20),
              child: PaymentWidget(),
            ),
            AuthButton(
              text: 'Proceed To Delivery',
              onTap: () {
                AppNavigation.push(context, const CheckOutPage());
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
