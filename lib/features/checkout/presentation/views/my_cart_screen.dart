import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment_application/features/checkout/data/repo/checkout_repo_impl.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/app_button.dart';
import '../cubit/checkout_cubit.dart';
import '../widget/order_info_item.dart';
import '../widget/paymeny_methods_bottom_sheet.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(CheckoutRepoImpl()),
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
