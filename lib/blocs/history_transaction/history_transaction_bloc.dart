import 'package:bank/models/transaction_model.dart';
import 'package:bank/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_transaction_event.dart';
part 'history_transaction_state.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  HistoryTransactionBloc() : super(HistoryTransactionInitial()) {
    on<HistoryTransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          emit(HistoryTransactionLoading());

          final gettransaction =
              await TransactionService().gethistorytansaction();

          print(gettransaction);

          emit(HistoryTransactionSucces(gettransaction));
        } catch (e) {
          emit(
            HistoryTransactionFailed(e.toString()),
          );
        }
      }
    });
  }
}
