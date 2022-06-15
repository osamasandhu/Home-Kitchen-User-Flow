import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/back_arrow_widget.dart';

AppBar getAppBarWidget({
  required String title,
  Color? color,
  Widget? action,
  Color? arrowColor,
  Color? containerColor,
  bool displayLeading = true,
}) {
  return AppBar(
    backgroundColor: color ?? const Color(0xFFFAFAFA),
    title: Text(title),
    leading: displayLeading
        ? BackArrowWidget(
            arrowColor: arrowColor ?? const Color(0xFF393835),
            containerColor: containerColor,
          )
        : null,
    leadingWidth: 64,
    actions: [action ?? const SizedBox(height: 0, width: 0)],
  );
}
