import 'package:flutter_payment_application/core/utils/api_keys.dart';
import 'package:flutter_payment_application/core/utils/api_service.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel input) async {
    var repsonse = await apiService.post(
      body: input.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentInitentModel = PaymentIntentModel.fromJson(repsonse.data);
    return paymentInitentModel;
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: "Kareem",
    ));
  }

  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

//! Statrt Point
  Future makePaument({
    required PaymentIntentInputModel input,
  }) async {
    var paymentModel = await createPaymentIntent(input);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentModel.clientSecret!,
    );

    await displayPaymentSheet();
  }
}
