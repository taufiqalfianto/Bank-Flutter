part of 'transfer_bloc.dart';

class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class Transfer extends TransferEvent {
  final TransferFormModel data;
  const Transfer(this.data);

  @override
  List<Object> get props => [data];
}
