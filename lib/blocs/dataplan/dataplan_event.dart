part of 'dataplan_bloc.dart';

class DataplanEvent extends Equatable {
  const DataplanEvent();

  @override
  List<Object> get props => [];
}

class DataPlanPost extends DataplanEvent {
  final DataPlanFormModel data;

  const DataPlanPost(this.data);

  @override
  List<Object> get props => [data];
}
