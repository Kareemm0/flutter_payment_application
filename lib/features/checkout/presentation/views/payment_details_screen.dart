import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/app_button.dart';
import '../cubit/checkout_cubit.dart';
import '../widget/card_container_item.dart';
import '../widget/custom_credit_card.dart';
import 'thank_you_screen.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          return Scaffold(
            appBar: appBar(title: "Payment Details"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
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
                ),
                SliverToBoxAdapter(
                  child: CustomCreditCard(
                    formKey: formKey,
                    autovalidateMode: autovalidateMode,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AppButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThankYouScreen(),
                              ),
                            );
                          }
                        },
                        text: "Pay Now",
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
