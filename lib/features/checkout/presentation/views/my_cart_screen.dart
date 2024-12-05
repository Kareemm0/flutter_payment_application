import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/app_button.dart';
import '../cubit/checkout_cubit.dart';
import '../widget/card_container_item.dart';
import '../widget/order_info_item.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          return Scaffold(
            appBar: appBar(title: 'My Cart'),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Expanded(child: Image.asset(AppImages.cart)),
                  const SizedBox(height: 25),
                  ...List.generate(
                    3,
                    (index) => OrderInfoItem(
                      title: cubit.title[index],
                      price: cubit.price[index],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 34,
                    color: Color(0xffC7C7C7),
                  ),
                  const OrderInfoItem(
                    title: "Total",
                    price: "\$50.97",
                    style: AppStyles.style24,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          builder: (context) =>
                              const PaymentMethodsButtomSheet());
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
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
                const AppButton(
                  text: "Continue",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
