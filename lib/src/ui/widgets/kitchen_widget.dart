import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/auth_button_widet.dart';

class KitchenWidget extends StatelessWidget {
  const KitchenWidget({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.image,
  }) : super(key: key);

  final double? width;
  final double? height;

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: height ?? 240,
      width: width ?? 354,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 134,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 12,
              bottom: 7,
              right: 18,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: Color(0xFF2D2C29),
                  ),
                ),
                const Spacer(),
                const Text(
                  '4.9',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Color(0xFFC7461B),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFB800),
                  size: 20,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              bottom: 12,
              right: 18,
            ),
            child: Row(
              children: [
                Image.asset(AppAssets.scooter, width: 24, height: 14),
                const SizedBox(width: 11),
                const Text(
                  'Free Delivery',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: Color(0xFF8B8B8A),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 14, right: 18),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonWidget(title: 'Vegan', onTap: () {}),
                const SizedBox(width: 17),
                ButtonWidget(title: 'Seafood', onTap: () {}),
                const SizedBox(width: 17),
                ButtonWidget(title: 'Keto', onTap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
