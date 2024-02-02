import 'package:bank/models/data_plan_form_model.dart';
import 'package:bank/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dataplan_event.dart';
part 'dataplan_state.dart';

class DataplanBloc extends Bloc<DataplanEvent, DataplanState> {
  DataplanBloc() : super(DataplanInitial()) {
    on<DataplanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(DataplanLOading());
          await TransactionService().dataplan(event.data);
          emit(DataplanSucces());
        } catch (e) {
          emit(DataplanFailed(e.toString()));
        }
      }
    });
  }
}
