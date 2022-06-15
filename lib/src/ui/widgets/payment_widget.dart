import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/utils/colors.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 21),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _getRow(title: 'Subtotal:', value: '£38.50'),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 16.5),
            child: _getRow(title: 'Discount:', value: '£4.50'),
          ),
          const Divider(thickness: 2, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 24.5),
          _getRow(
            title: 'TOTAL:',
            value: '£34.00',
            valueTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: 1,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRow({
    required String title,
    required String value,
    TextStyle? valueTextStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            letterSpacing: 1,
            color: AppColors.grey,
          ),
        ),
        Text(
          value,
          style: valueTextStyle ??
              const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 1,
                color: Color(0xFF393835),
              ),
        ),
      ],
    );
  }
}
