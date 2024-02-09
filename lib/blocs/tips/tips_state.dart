part of 'tips_bloc.dart';

class TipsState extends Equatable {
  const TipsState();

  @override
  List<Object> get props => [];
}

class TipsInitial extends TipsState {}

class TipsLoading extends TipsState {}

class TipsSuccces extends TipsState {
  final List<TipsModel> tips;
  const TipsSuccces(this.tips);

  @override
  List<Object> get props => [this.tips];
}

class TipsFailed extends TipsState {
  final String e;
  const TipsFailed(this.e);

  @override
  List<Object> get props => [this.e];
}
