import 'package:flutter/material.dart';

import '../../../../core/widget/app_button.dart';

class BarCodeAndButton extends StatelessWidget {
  const BarCodeAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.barcode_reader,
          size: 40,
        ),
        Flexible(
          child: AppButton(
            color: Colors.transparent,
            text: "PAID",
            textColor: const Color(0xff34A853),
            width: MediaQuery.sizeOf(context).width * 0.2,
            borderColor: const Color(0xff34A853),
          ),
        ),
      ],
    );
  }
}
