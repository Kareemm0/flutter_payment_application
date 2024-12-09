import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool isLoading;
  const AppButton(
      {super.key,
      this.onTap,
      this.text,
      this.width,
      this.color,
      this.textColor,
      this.borderColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width ?? double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          color: color ?? const Color(0xff34A853),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text ?? "Compelete Payment",
                  style: AppStyles.style22.copyWith(color: textColor),
                ),
        ),
      ),
    );
  }
}
