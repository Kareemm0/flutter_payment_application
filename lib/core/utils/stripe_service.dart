import 'package:dio/dio.dart';
import 'package:flutter_payment_application/core/utils/api_keys.dart';
import 'package:flutter_payment_application/core/utils/api_service.dart';
import 'package:flutter_payment_application/features/checkout/data/model/EphmeralKey/ephmeral_key_model/ephmeral_key_model.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/model/init_payment_sheet/init_payment_sheet_input_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //! Create Payment Intent
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel input) async {
    var repsonse = await apiService.post(
      body: input.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentInitentModel = PaymentIntentModel.fromJson(repsonse.data);
    return paymentInitentModel;
  }

//! Init Payment Sheet

  Future initPaymentSheet({required InitPaymentSheetInputModel input}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: input.paymentIntentClientSecret,
      merchantDisplayName: "Kareem",
      customerEphemeralKeySecret: input.ephmeralKeySecret,
      customerId: input.customerId,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

//! Create Ephmeral Key
  Future<EphmeralKeyModel> createEphmeralKey(
      {required String customerId}) async {
    var repsonse = await apiService.post(
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': "2024-11-20.acacia",
      },
      body: {
        'customer': customerId,
      },
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var ephmeralKeyModel = EphmeralKeyModel.fromJson(repsonse.data);
    return ephmeralKeyModel;
  }

//! Statrt Point
  Future makePaument({
    required PaymentIntentInputModel input,
  }) async {
    var paymentModel = await createPaymentIntent(input);
    var ephmeralModel = await createEphmeralKey(customerId: input.customerId);

    var inputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymentModel.clientSecret!,
      ephmeralKeySecret: ephmeralModel.secret!,
      customerId: input.customerId,
    );
    await initPaymentSheet(
      input: inputModel,
    );

    await displayPaymentSheet();
  }
}
