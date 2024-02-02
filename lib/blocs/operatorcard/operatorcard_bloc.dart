import 'package:bank/models/operator_card_model.dart';
import 'package:bank/services/operatorcard_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operatorcard_event.dart';
part 'operatorcard_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is GetOperatoeCard) {
        try {
          emit(OperatorCardLoading());

          final cardoperator = await OperatorCardService().getoperatorcard();

          emit(OperatorCardSucces(cardoperator));
        } catch (e) {
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
