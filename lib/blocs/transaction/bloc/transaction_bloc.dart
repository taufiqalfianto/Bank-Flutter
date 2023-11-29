import 'package:bank/models/topup_form_model.dart';
import 'package:bank/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is Transaction) {
        try {
          emit(TransactionLoading());

          final redirectUrl = await TransactionService().topup(event.data);

          emit(TransactionSucces(redirectUrl));
        } catch (e) {
          emit(
            TransactionFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
