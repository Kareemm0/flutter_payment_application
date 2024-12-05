import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title, price;
  final TextStyle? style;
  const OrderInfoItem(
      {super.key, required this.title, required this.price, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ?? AppStyles.style18,
        ),
        Text(
          price,
          style: style ?? AppStyles.style18,
        )
      ],
    );
  }
}
