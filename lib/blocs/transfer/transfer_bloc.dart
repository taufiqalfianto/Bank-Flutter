import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if (event is Transfer) {
        try {
          emit(TransferLoading());

          await TransactionService().transfer(event.data);

          emit(TransferSucces());
        } catch (e) {
          emit(
            TransferFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
