part of 'dataplan_bloc.dart';

class DataplanState extends Equatable {
  const DataplanState();

  @override
  List<Object> get props => [];
}

class DataplanInitial extends DataplanState {}

class DataplanLOading extends DataplanState {}

class DataplanFailed extends DataplanState {
  final String e;
  const DataplanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DataplanSucces extends DataplanState {}
