import 'package:flutter/material.dart';

import 'features/checkout/presentation/views/my_cart_screen.dart';

void main() {
  runApp(const FlutterPaymentGetway());
}

class FlutterPaymentGetway extends StatelessWidget {
  const FlutterPaymentGetway({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartScreen(),
    );
  }
}
