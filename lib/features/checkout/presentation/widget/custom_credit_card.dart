import 'package:flutter/material.dart';

class CustomCreditCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;
  const CustomCreditCard(
      {super.key, required this.formKey, this.autovalidateMode});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cvvCode = '';
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // CreditCardWidget(
        //   isHolderNameVisible: true,
        //   cardNumber: cardNumber,
        //   expiryDate: expiryDate,
        //   cardHolderName: cardHolderName,
        //   cvvCode: cvvCode,
        //   showBackView: showBackView,
        //   onCreditCardWidgetChange: (val) {},
        // ),
        // CreditCardForm(
        //   autovalidateMode: widget.autovalidateMode,
        //   cardNumber: cardNumber,
        //   expiryDate: expiryDate,
        //   cardHolderName: cardHolderName,
        //   cvvCode: cvvCode,
        //   onCreditCardModelChange: (creditCardModel) {
        //     cardHolderName = creditCardModel.cardHolderName;
        //     cardNumber = creditCardModel.cardNumber;
        //     expiryDate = creditCardModel.expiryDate;
        //     cvvCode = creditCardModel.cvvCode;
        //     showBackView = creditCardModel.isCvvFocused;
        //     setState(() {});
        //   },
        //   formKey: widget.formKey,
        // ),
      ],
    );
  }
}
