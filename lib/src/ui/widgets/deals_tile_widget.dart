import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class DealsTileWidget extends StatelessWidget {
  const DealsTileWidget({
    Key? key,
    this.bottomMargin,
    required this.title,
    required this.image,
    required this.subtitle,
  }) : super(key: key);

  final double? bottomMargin;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(bottom: bottomMargin ?? 14),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
            child: Image.asset(
              image,
              width: 92,
              height: 92,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getStar(),
                    _getStar(),
                    _getStar(),
                    _getStar(),
                    _getStar(),
                    const SizedBox(width: 10),
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: Color(0xFFC7461B),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 13.0,
                    bottom: 7,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(0xFF8B8B8A),
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Text(
                        '£8',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getStar() {
    return const Icon(
      Icons.star,
      color: Color(0xFFFFBB00),
    );
  }
}
