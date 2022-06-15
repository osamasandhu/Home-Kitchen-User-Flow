import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/nav.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({
    Key? key,
    this.arrowColor,
    this.containerColor,
  }) : super(key: key);

  final Color? arrowColor;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: containerColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: arrowColor ?? Colors.black,
          size: 30,
        ),
        onPressed: () {
          AppNavigation.pop(context);
        },
      ),
    );
  }
}
