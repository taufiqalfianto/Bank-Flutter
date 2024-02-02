part of 'operatorcard_bloc.dart';

class OperatorCardState extends Equatable {
  const OperatorCardState();

  @override
  List<Object> get props => [];
}

class OperatorCardInitial extends OperatorCardState {}

class OperatorCardLoading extends OperatorCardState {}

class OperatorCardFailed extends OperatorCardState {
  final String e;
  const OperatorCardFailed(this.e);

  @override
  List<Object> get props => [e];
}

class OperatorCardSucces extends OperatorCardState {
  final List<OperatorCardModel> operators;
  const OperatorCardSucces(this.operators);

  @override
  List<Object> get props => [operators];
}
