part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailed extends TransactionState {
  final String e;
  const TransactionFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransactionSucces extends TransactionState {
  final String redirectUrl;
  const TransactionSucces(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}
