import 'package:flutter/material.dart';

class DecoratedContainerWidget extends StatelessWidget {
  const DecoratedContainerWidget({
    Key? key,
    required this.child,
    this.verticalPadding,
  }) : super(key: key);

  final Widget child;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: verticalPadding ?? 17,
      ),
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFEAEBEC),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
