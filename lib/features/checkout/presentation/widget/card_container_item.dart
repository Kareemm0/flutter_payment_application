import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardConatnierItem extends StatelessWidget {
  final bool isActive;
  final String images;
  const CardConatnierItem({
    super.key,
    this.isActive = false,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1.50,
              color: isActive ? const Color(0xff34A853) : Colors.grey,
            ),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xff34A853) : Colors.white,
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: SvgPicture.asset(
          images,
          height: 24,
          fit: BoxFit.scaleDown,
        )),
      ),
    );
  }
}
