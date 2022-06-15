import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';
import 'package:home_kitchen_user_app/src/ui/pages/driver_tracking_page.dart';
import 'package:home_kitchen_user_app/src/ui/pages/order_detail_page.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Orders'),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            AppNavigation.push(context, const OrderDetailPage());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            height: 109,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppAssets.orderDetailImage,
                    width: 86,
                    height: 81,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stewed Lamb',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '7 Bell Yard London WC2A 2JR, UK',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 1,
                          color: AppColors.grey,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getButton(
                      color: const Color(0xFFC7461B),
                      text: index % 2 == 0 ? 'EN ROUTE' : 'PREP',
                      onTap: () {},
                    ),
                    const SizedBox(height: 4),
                    _getButton(
                      color: index % 2 == 0
                          ? AppColors.green
                          : const Color(0xFF8B8B8A),
                      text: 'TRACK',
                      onTap: index % 2 == 0
                          ? () {
                              AppNavigation.push(
                                context,
                                const DriverTrackingPage(),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        itemCount: 50,
      ),
    );
  }

  Widget _getButton({
    required Color color,
    required String text,
    required Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 101,
          height: 23,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      );
}
