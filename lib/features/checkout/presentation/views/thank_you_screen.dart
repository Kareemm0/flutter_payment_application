import 'package:flutter/material.dart';
import 'package:flutter_payment_application/core/widget/app_bar.dart';
import '../widget/custom_check_cicle.dart';
import '../widget/custom_dashed_line_container.dart';
import '../widget/custom_left_circle.dart';
import '../widget/custom_right_circle.dart';
import '../widget/custom_screen_container.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "",
      ),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomScreenContainer(),
              CustomDashedLineContainer(),
              CustomLeftCircle(),
              CustomRightCircle(),
              CustomCheckCicle()
            ],
          ),
        ),
      ),
    );
  }
}
