import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/decorated_colored_container_widget.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class DriverTrackingPage extends StatelessWidget {
  const DriverTrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'Tracking #54', color: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Container(
        padding:
            const EdgeInsets.only(top: 14, right: 14, left: 14, bottom: 42),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.map),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const DecoratedColoredContainerWidget(
                        icon: Icons.watch_later_outlined,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getTitle(title: 'Estimated Delivery'),
                          const SizedBox(height: 8),
                          _getSubtitle(subtitle: '03:45 PM'),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 9),
                    child: const VerticalDivider(
                      thickness: 2,
                      color: Color(0xFFD7D7D7),
                    ),
                  ),
                  Row(
                    children: [
                      const DecoratedColoredContainerWidget(
                        icon: Icons.location_on_outlined,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getTitle(title: 'Place'),
                          const SizedBox(height: 8),
                          _getSubtitle(subtitle: '7 Bell Yard, WC2A 2JR, UK'),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xFFEEEEEE),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset(
                            AppAssets.driverTracking,
                            height: 48,
                            width: 48,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _getTitle(title: 'Courier'),
                            const SizedBox(height: 8),
                            _getSubtitle(subtitle: 'Brian Cumin'),
                          ],
                        ),
                        const Spacer(),
                        DecoratedColoredContainerWidget(
                          icon: Icons.call,
                          backgroundColor: AppColors.green,
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSubtitle({required String subtitle}) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Color(0xFF292825),
      ),
    );
  }

  Widget _getTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1,
        color: AppColors.grey,
      ),
    );
  }
}
