class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String ephmeralKeySecret;
  final String customerId;

  InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    required this.ephmeralKeySecret,
    required this.customerId,
  });
}
