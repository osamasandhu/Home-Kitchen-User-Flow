import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/item_detail_page.dart';
import 'package:home_kitchen_user_app/src/ui/views/account_view.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/deals_tile_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/title_text_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';
import 'package:home_kitchen_user_app/src/utils/const.dart';

class KitchenDetailPage extends StatelessWidget {
  const KitchenDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getAppBarWidget(
        containerColor: Colors.white.withOpacity(0.5),
        arrowColor: AppColors.orange,
        title: '',
        color: Colors.transparent,
        action: GestureDetector(
          onTap: () {
            AppNavigation.push(context, const AccountView());
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 17.0, top: 12.0),
            child: Image.asset(
              AppAssets.blackImage,
              height: 47,
              width: 41,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: statusBarPadding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppAssets.kitchenDetailImage,
                height: 203,
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TitleTextWidget(
                title: "Patty’s Home Delights",
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 13),
              child: Text(
                kitchenDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                children: [
                  _getButton(title: 'Vegan', onTap: () {}),
                  _getButton(onTap: () {}, title: 'Seafood'),
                  _getButton(onTap: () {}, title: 'Keto'),
                  _getButton(onTap: () {}, title: 'Indian'),
                  _getButton(onTap: () {}, title: 'Halal'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 19,
              ),
              child: Image.asset(
                AppAssets.saladImage,
                height: 183,
                fit: BoxFit.fill,
              ),
            ),
            const TitleTextWidget(
              title: 'Patty’s Home Delights - Dishes',
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 22),
              child: Text(
                'Deals',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 1,
                  color: AppColors.orange,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      AppNavigation.push(context, const ItemDetailPage());
                    },
                    child: const DealsTileWidget(
                      image: AppAssets.itemDetailImage,
                      title: 'Stewed Lamb',
                      subtitle: itemDescription,
                    ),
                  );
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getButton({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 13.0),
      child: ButtonWidget(onTap: onTap, title: title),
    );
  }
}
