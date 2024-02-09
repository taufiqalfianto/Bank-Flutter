import 'package:bank/models/tips_model.dart';
import 'package:bank/services/tips_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tips_event.dart';
part 'tips_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipsState> {
  TipsBloc() : super(TipsInitial()) {
    on<TipsEvent>((event, emit) async {
      if (event is TipsMethodGet) {
        try {
          emit(TipsLoading());
          final tips = await TipsService().gettips();

          emit(TipsSuccces(tips));
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
