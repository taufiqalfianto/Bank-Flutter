part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class Transaction extends TransactionEvent {
  final TopupFormModel data;
  const Transaction(this.data);

  @override
  List<Object> get props => [data];
}
