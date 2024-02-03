part of 'history_transaction_bloc.dart';

class HistoryTransactionState extends Equatable {
  const HistoryTransactionState();

  @override
  List<Object> get props => [];
}

class HistoryTransactionInitial extends HistoryTransactionState {}

class HistoryTransactionLoading extends HistoryTransactionState {}

class HistoryTransactionFailed extends HistoryTransactionState {
  final String e;
  const HistoryTransactionFailed(this.e);

  @override
  List<Object> get props => [this.e];
}

class HistoryTransactionSucces extends HistoryTransactionState {
  final List<HistoryTransactionModel> transaction;
  const HistoryTransactionSucces(this.transaction);

  @override
  List<Object> get props => [transaction];
}
