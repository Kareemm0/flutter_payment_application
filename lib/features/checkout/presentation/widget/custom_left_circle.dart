import 'package:flutter/material.dart';

class CustomLeftCircle extends StatelessWidget {
  const CustomLeftCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -20,
      bottom: MediaQuery.sizeOf(context).height * 0.2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
