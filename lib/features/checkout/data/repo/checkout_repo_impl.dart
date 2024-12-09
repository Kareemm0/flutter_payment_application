import 'package:dartz/dartz.dart';
import 'package:flutter_payment_application/core/error/failuers.dart';
import 'package:flutter_payment_application/core/utils/stripe_service.dart';
import 'package:flutter_payment_application/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:flutter_payment_application/features/checkout/data/repo/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService service = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel input}) async {
    try {
      await service.makePaument(input: input);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
