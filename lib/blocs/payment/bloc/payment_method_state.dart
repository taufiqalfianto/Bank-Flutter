part of 'payment_method_bloc.dart';

class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodfailed extends PaymentMethodState {
  final String e;
  const PaymentMethodfailed(this.e);

  @override
  List<Object> get props => [e];
}

class PaymentMethodSucces extends PaymentMethodState {
  final List<PaymentMethodModel> paymentmethod;
  const PaymentMethodSucces(this.paymentmethod);

   @override
  List<Object> get props => [paymentmethod];
}
