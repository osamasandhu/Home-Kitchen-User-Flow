import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key, this.iconColor}) : super(key: key);

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: const Color(0xFFEAEBEC)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
      child: Row(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFFDF6EA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: Color(0xFFFFA214),
            ),
          ),
          const SizedBox(width: 22),
          Text(
            '7 Bell Yard, London, WC2A 2JR',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1,
              color: AppColors.grey,
            ),
          ),
          const Spacer(),
          Icon(Icons.edit_outlined, color: iconColor ?? const Color(0xFFC5C4C4))
        ],
      ),
    );
  }
}
