class TransferFormModel {
  final String? amount;
  final String? pin;
  final String? sendto;

  TransferFormModel({
    this.amount,
    this.pin,
    this.sendto,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendto,
      };

  TransferFormModel copywith({
    String? amount,
    String? pin,
    String? sendto,
  }) =>
      TransferFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendto: sendto ?? this.sendto,
      );
}
