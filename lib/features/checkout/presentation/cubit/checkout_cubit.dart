import 'package:bloc/bloc.dart';

import '../../../../core/utils/app_images.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

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
}
