import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class DecoratedColoredContainerWidget extends StatelessWidget {
  const DecoratedColoredContainerWidget({
    Key? key,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.width,
    this.height,
    this.margin,
    this.widget,
  }) : super(key: key);

  final Widget? widget;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData? icon;
  final double? height;
  final double? width;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 34,
      width: width ?? 34,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFFDF6EA),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      margin: margin,
      child: widget ?? Icon(icon, color: iconColor ?? AppColors.orange),
    );
  }
}
