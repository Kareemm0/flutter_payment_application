import 'package:flutter/material.dart';

class CustomRightCircle extends StatelessWidget {
  const CustomRightCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -20,
      bottom: MediaQuery.sizeOf(context).height * 0.2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
