import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment_application/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../../../core/widget/app_button.dart';
import '../cubit/checkout_cubit.dart';
import '../views/thank_you_screen.dart';
import 'card_container_item.dart';

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(CheckoutRepoImpl()),
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ThankYouScreen()));
          } else if (state is CheckoutFailureState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 62,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () => cubit.changeIndex(index),
                          child: CardConatnierItem(
                            images: cubit.images[index],
                            isActive:
                                cubit.currentIndex == index ? true : false,
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.images.length,
                  ),
                ),
                const SizedBox(height: 32),
                AppButton(
                  isLoading: state is CheckoutLoadingState ? true : false,
                  text: "Continue",
                  onTap: () {
                    // PaymentIntentInputModel inputModel =
                    //     PaymentIntentInputModel(
                    //   amount: "100",
                    //   currency: "USD",
                    //   customerId: "cus_RMw6z3rS42Hh4l",
                    // );
                    // cubit.makePayment(input: inputModel);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PaypalCheckoutView(
                        sandboxMode: true,
                        clientId: "YOUR CLIENT ID",
                        secretKey: "YOUR SECRET KEY",
                        transactions: const [
                          {
                            "amount": {
                              "total": '100',
                              "currency": "USD",
                              "details": {
                                "subtotal": '100',
                                "shipping": '0',
                                "shipping_discount": 0
                              }
                            },
                            "description":
                                "The payment transaction description.",
                            "item_list": {
                              "items": [
                                {
                                  "name": "Apple",
                                  "quantity": 4,
                                  "price": '10',
                                  "currency": "USD"
                                },
                                {
                                  "name": "Pineapple",
                                  "quantity": 5,
                                  "price": '12',
                                  "currency": "USD"
                                }
                              ],
                            }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          log("onSuccess: $params");
                          Navigator.pop(context);
                        },
                        onError: (error) {
                          log("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          print('cancelled:');
                          Navigator.pop(context);
                        },
                      ),
                    ));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
