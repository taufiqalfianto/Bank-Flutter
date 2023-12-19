import 'package:bank/models/user_model.dart';
import 'package:bank/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is getuserbyusername) {
        try {
          emit(UserLoading());

          final users = await UserService().getuserbyname(event.username);

          emit(UserSucces(users));
        } catch (e) {
          rethrow;
        }
      }
      if (event is getuserrecent) {
        try {
          emit(UserLoading());

          final users = await UserService().getrecentuser();

          emit(UserSucces(users));
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
