import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget(
      {Key? key, required this.title, this.textAlign, this.fontWeight})
      : super(key: key);

  final TextAlign? textAlign;
  final String title;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: 16,
        letterSpacing: 1,
        color: const Color(0xFF393835),
      ),
    );
  }
}
