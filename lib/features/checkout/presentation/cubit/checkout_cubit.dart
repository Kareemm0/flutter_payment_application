import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_payment_application/features/checkout/data/repo/checkout_repo.dart';

import '../../../../core/utils/app_images.dart';
import '../../data/model/payment_intent_input_model/payment_intent_input_model.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo repo;
  CheckoutCubit(this.repo) : super(CheckoutInitial());

  List<String> title = [
    "Order Subtotal",
    "Discount",
    "Shipping",
  ];

  List<String> price = [
    "\$42.97",
    '\$0',
    "\$8",
  ];

  List<String> images = [
    AppImages.card,
    AppImages.pay,
    AppImages.apple,
  ];

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  Future makePayment({
    required PaymentIntentInputModel input,
  }) async {
    emit(CheckoutLoadingState());

    var data = await repo.makePayment(input: input);
    data.fold(
      (failure) => emit(CheckoutFailureState(failure.errmessage)),
      (success) => emit(CheckoutSuccessState()),
    );
  }

  @override
  void onChange(Change<CheckoutState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
