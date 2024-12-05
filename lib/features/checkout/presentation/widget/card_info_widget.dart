import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.logo),
          const SizedBox(height: 30),
          const SizedBox(width: 23),
          const Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "Credit Card?",
                style: AppStyles.style18,
              ),
              TextSpan(
                text: "Mastercard **78",
                style: AppStyles.style18,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
