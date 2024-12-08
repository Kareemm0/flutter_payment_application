import 'package:flutter_payment_application/core/utils/api_keys.dart';
import 'package:flutter_payment_application/core/utils/api_service.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

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
}
