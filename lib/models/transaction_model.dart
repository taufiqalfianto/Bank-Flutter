import 'package:bank/models/payment_method_model,.dart';
import 'package:bank/models/transaction_type_model.dart';

class HistoryTransactionModel {
  final int? id;
  final int? amount;
  final DateTime? createdAt;
  final PaymentMethodModel? paymentMethods;
  final TransactionTypeModel? transactiontype;

  HistoryTransactionModel({
    this.id,
    this.amount,
    this.createdAt,
    this.paymentMethods,
    this.transactiontype,
  });

  factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionModel(
        id: json['id'],
        amount: json['amount'],
        createdAt: DateTime.tryParse(json['created_at']),
        paymentMethods: json['payment_method'] == null
            ? null
            : PaymentMethodModel.fromJson(
                json['payment_method'],
              ),
        transactiontype: json['transaction_type'] == null
            ? null
            : TransactionTypeModel.fromJson(
                json['transaction_type'],
              ),
      );
}