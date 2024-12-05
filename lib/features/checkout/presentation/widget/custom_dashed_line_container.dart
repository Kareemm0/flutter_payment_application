import 'package:flutter/material.dart';

class CustomDashedLineContainer extends StatelessWidget {
  const CustomDashedLineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20 + 8,
      right: 20 + 8,
      bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
      child: Row(
        children: [
          ...List.generate(
            30,
            (context) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 2,
                  color: const Color(0xffB8B8B8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
