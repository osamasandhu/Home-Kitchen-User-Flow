import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/views/cart_view.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/cart_tile_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/counter_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/decorated_colored_container_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';
import 'package:home_kitchen_user_app/src/utils/const.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(
        title: 'Details',
        action: const DecoratedColoredContainerWidget(
          icon: Icons.favorite_border,
          backgroundColor: Colors.white,
          height: 40,
          width: 40,
          margin: EdgeInsets.only(right: 14, top: 4, bottom: 4),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppAssets.itemDetailImage,
                height: 198,
                width: 210,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 19.0),
              child: Center(
                child: CounterWidget(
                  callback: (value) {
                    counter = value;
                  },
                  counter: counter,
                  height: 38,
                  width: 38,
                  textWidth: 57,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stewed Lamb',
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
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: 1,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 30),
              child: Row(
                children: [
                  _getColumn(title: 'Prep Time', value: '15 min'),
                  Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 42.4, right: 30.5),
                    child: const VerticalDivider(
                      thickness: 2,
                      color: Color(0xFFEDEDED),
                    ),
                  ),
                  _getColumn(title: 'Delivery Time', value: '17 min'),
                ],
              ),
            ),
             const Text(
              itemDescription,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1,
                color: Color(0xff8B8B8A),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0, bottom: 19.0),
              child: Text(
                'Add-Ons',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 1,
                  color: AppColors.green,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (ctx, index) => const CartTileWidget(),
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 14, right: 14),
        child: AuthButton(
          text: 'Add To Cart',
          onTap: () {
            AppNavigation.push(context, const CartView());
          },
        ),
      ),
    );
  }

  Widget _getColumn({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.access_time),
            const SizedBox(width: 10),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: Color(0xFF393835),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
