import 'package:flutter/material.dart';
import 'package:flutter_payment_application/core/utils/app_styles.dart';
import 'package:flutter_payment_application/features/checkout/presentation/widget/order_info_item.dart';
import 'barcode_and_button_container.dart';
import 'card_info_widget.dart';

class CustomScreenContainer extends StatelessWidget {
  const CustomScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 70 + 16, left: 22, right: 22),
        child: Column(
          children: [
            Text(
              "Thank You",
              style: AppStyles.style25,
            ),
            Text(
              "Your Transaction was successful",
              style: AppStyles.style20,
            ),
            const SizedBox(height: 42),
            const OrderInfoItem(
              title: "Date",
              price: "07/08/2023",
              style: AppStyles.style18,
            ),
            const SizedBox(height: 20),
            const OrderInfoItem(
              title: "Time",
              price: "10:15 AM",
              style: AppStyles.style18,
            ),
            const SizedBox(height: 20),
            const OrderInfoItem(
              title: "To",
              price: "Kareem ",
              style: AppStyles.style18,
            ),
            const Divider(thickness: 2, height: 60),
            OrderInfoItem(
                title: "Total", price: "\$50.97", style: AppStyles.style25),
            const CardInfoWidget(),
            const Spacer(),
            const BarCodeAndButton(),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
