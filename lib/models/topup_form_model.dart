class TopupFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethod;

  TopupFormModel({
    this.amount,
    this.pin,
    this.paymentMethod,
  });

  Map<String, dynamic> tojson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethod,
      };

  TopupFormModel copywith({
    String? amount,
    String? pin,
    String? paymentMethod,
  }) =>
      TopupFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
