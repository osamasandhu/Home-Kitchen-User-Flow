import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/item_detail_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/kitchen_detail_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/deals_tile_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/kitchen_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';
import 'package:home_kitchen_user_app/src/utils/const.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
    required this.selectedPageIndex,
    required this.callBack,
  }) : super(key: key);

  int selectedPageIndex;
  final Function(int) callBack;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 6,
                bottom: 19,
                left: 10,
                right: 8,
              ),
              decoration:  const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AppAssets.homePageImage,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.homeKitchenLogo,
                        height: 52,
                        width: 144,
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        '[Change Address]',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          widget.selectedPageIndex = 2;
                          widget.callBack(widget.selectedPageIndex);
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(AppAssets.profileImage),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: 'Homemade, Burgers, Chicken',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                letterSpacing: 1,
                                color: Color(0xFFD3CFCA),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFFD3CFCA),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.orange,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 11,
                                bottom: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.orange,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.orange,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 22,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                margin: const EdgeInsets.only(bottom: 2),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Now',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 22,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: AppColors.orange,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Later',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: Color(0xFFD3CFCA),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Image.asset(AppAssets.filter, height: 18, width: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_searchController.text.toLowerCase() != 'burger' &&
                        _searchController.text.toLowerCase() != 'halal') ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: _getText(text: 'Explore by Dish'),
                      ),
                      SizedBox(
                        height: 82,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) => Material(
                            elevation: 5,
                            child: Container(
                              height: 82,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                    index % 2 == 0
                                        ? AppAssets.burger
                                        : AppAssets.chicken,
                                  ),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.only(
                                bottom: 6,
                                left: 10,
                                right: 10,
                              ),
                              margin: const EdgeInsets.only(right: 16),
                              child: Container(
                                alignment: Alignment.center,
                                width: 80,
                                height: 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black.withOpacity(0.25),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFFEAEBEC)
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  index % 2 == 0 ? 'Burger' : 'Chicken',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: 50,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ] else
                      const SizedBox(height: 14),
                    SizedBox(
                      height: 181,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) => Container(
                          height: 181,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.only(right: 23),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  AppAssets.freeDelivery,
                                  width: 306,
                                  height: 146,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 10),
                                child: Text(
                                  'Claim Your FREE Delivery Voucher!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        itemCount: 50,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 17, bottom: 11, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _getText(
                            text:
                                _searchController.text.toLowerCase() == 'burger'
                                    ? 'Burger Kitchen'
                                    : _searchController.text.toLowerCase() ==
                                            'halal'
                                        ? 'Halal Kitchens'
                                        : 'Top Kitchens',
                          ),
                          _getTextButton(onTap: () {}),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 255,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              AppNavigation.push(
                                context,
                                const KitchenDetailPage(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Stack(
                                children: [
                                  KitchenWidget(
                                    width: 300,
                                    image:
                                        _searchController.text.toLowerCase() ==
                                                'burger'
                                            ? AppAssets.burgerResult
                                            : _searchController.text
                                                        .toLowerCase() ==
                                                    'halal'
                                                ? AppAssets.halal
                                                : AppAssets.favoriteFood,
                                    title:
                                        _searchController.text.toLowerCase() ==
                                                'burger'
                                            ? 'Birmin Burger Joint'
                                            : _searchController.text
                                                        .toLowerCase() ==
                                                    'halal'
                                                ? 'Amyra’s House of Halal'
                                                : 'Patty’s Home Delights',
                                  ),
                                  Positioned(
                                    top: 14,
                                    left: 14,
                                    child: Container(
                                      width: 86,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        '10-15 min',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          letterSpacing: 1,
                                          color: Color(0xFF2D2C29),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 15,
                        left: 14,
                        right: 14,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _getText(
                            text:
                                _searchController.text.toLowerCase() == 'burger'
                                    ? 'Popular Burger Dishes'
                                    : _searchController.text.toLowerCase() ==
                                            'halal'
                                        ? 'Popular Halal Dishes'
                                        : 'Popular Dishes',
                          ),
                          _getTextButton(onTap: () {}),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          bottom: 14,
                        ),
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              AppNavigation.push(context, const ItemDetailPage());
                            },
                            child: DealsTileWidget(
                              bottomMargin: 16,
                              image: _searchController.text.toLowerCase() ==
                                      'burger'
                                  ? AppAssets.dealTileBurger
                                  : _searchController.text.toLowerCase() ==
                                          'halal'
                                      ? AppAssets.dealTileHalal
                                      : AppAssets.itemDetailImage,
                              title: _searchController.text.toLowerCase() ==
                                      'burger'
                                  ? 'Porto Mushroom Burger'
                                  : _searchController.text.toLowerCase() ==
                                          'halal'
                                      ? 'Chicken Gyro'
                                      : 'Stewed Lamb',
                              subtitle: _searchController.text.toLowerCase() ==
                                      'burger'
                                  ? 'South Side Chop Shop'
                                  : _searchController.text.toLowerCase() ==
                                          'halal'
                                      ? 'Halal 360 Pop Shop'
                                      : itemDescription,
                            ),
                          );
                        },
                        itemCount: 50,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 1,
        color: AppColors.green,
      ),
    );
  }

  Widget _getTextButton({required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        'See All',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
