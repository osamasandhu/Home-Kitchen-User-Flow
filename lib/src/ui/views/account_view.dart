import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/favorites_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/login_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/my_details_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/orders_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/profile_address_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/decorated_colored_container_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/decorated_container_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/location_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Account', displayLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getText(text: 'Profile'),
            GestureDetector(
              onTap: () {
                AppNavigation.push(context, const MyDetailsPage());
              },
              child: DecoratedContainerWidget(
                child: Row(
                  children: [
                    const DecoratedColoredContainerWidget(icon: Icons.person),
                    const SizedBox(width: 16),
                    _getTileTitle(title: 'My Details'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getText(text: 'Addresses'),
                IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    AppNavigation.push(context, const ProfileAddressPage());
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.orange,
                    size: 40,
                  ),
                ),
              ],
            ),
            const LocationWidget(),
            _getText(text: 'Order Information'),
            GestureDetector(
              onTap: () {
                AppNavigation.push(context, const OrdersPage());
              },
              child: DecoratedContainerWidget(
                child: Row(
                  children: [
                    DecoratedColoredContainerWidget(
                      widget: Image.asset(
                        AppAssets.ordersIcon,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    _getTileTitle(title: 'Orders'),
                  ],
                ),
              ),
            ),
            _getText(text: 'Favorites'),
            GestureDetector(
              onTap: () {
                AppNavigation.push(context, const FavoritesPage());
              },
              child: DecoratedContainerWidget(
                child: Row(
                  children: [
                    const DecoratedColoredContainerWidget(icon: Icons.favorite),
                    const SizedBox(width: 14),
                    _getTileTitle(title: 'Favorites'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                AppNavigation.pushReplacement(context, const LoginPage());
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 28,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFEAEBEC),
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.logout),
                      const SizedBox(width: 22),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grey,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTileTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1,
        color: AppColors.grey,
      ),
    );
  }

  Widget _getText({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TitleTextWidget(title: text),
    );
  }
}
