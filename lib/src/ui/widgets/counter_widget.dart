import 'package:flutter/material.dart';

import 'title_text_widget.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
    required this.callback,
    required this.counter,
    this.width,
    this.height,
    this.textWidth,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? textWidth;
  final Function(int) callback;
  final int counter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int count;

  @override
  void initState() {
    count = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getContainer(
          icon: Icons.remove,
          onTap: () {
            if (count <= 1) {
              return;
            }
            count--;
            widget.callback(count);
            setState(() {});
          },
        ),
        SizedBox(
          width: widget.textWidth ?? 41,
          child: TitleTextWidget(
            title: count.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        _getContainer(
          icon: Icons.add,
          onTap: () {
            count++;
            widget.callback(count);
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _getContainer({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: widget.height ?? 27,
        width: widget.width ?? 27,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF393835),
        ),
      ),
    );
  }
}
