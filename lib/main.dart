import 'package:flutter/material.dart';
import 'package:flutter_payment_application/core/utils/api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'features/checkout/presentation/views/my_cart_screen.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishKey;
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

//! Payment Steps
// 1- Payment intent Object Create Payment intent(amount,currency , CustomerId --> it's Optional )
// -  Create Ephemeral Key(customer id)
// 2- init payment sheet(paymentIntentClientSecret -> (merchantDisplayName , inentClientSecret , ephmeralKeySecret))
// 3- Present Payment  Sheet ()
