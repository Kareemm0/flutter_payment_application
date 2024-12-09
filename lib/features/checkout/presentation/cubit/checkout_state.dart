part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class ChangeIndex extends CheckoutState {}

final class CheckoutLoadingState extends CheckoutState {}

final class CheckoutSuccessState extends CheckoutState {}

final class CheckoutFailureState extends CheckoutState {
  final String error;

  CheckoutFailureState(this.error);
}
