import 'package:bank/models/sign_in_form_model.dart';
import 'package:bank/models/sign_up_form_model.dart';
import 'package:bank/models/user_edit_form_model.dart';
import 'package:bank/models/user_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/services/user_service.dart';
import 'package:bank/services/wallet_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            emit(AuthLoading());

            final response = await AuthService().checkemail(event.email);

            if (response == false) {
              emit(AuthCheckEmailSucces());
            } else {
              emit(AuthFailed('Email sudah dipakai'));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final user = await AuthService().register(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogin) {
          try {
            emit(AuthLoading());

            final user = await AuthService().login(event.data);
            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthCurrentUser) {
          try {
            emit(AuthLoading());
            final SignInFormModel data =
                await AuthService().getCredentialLocal();
            final UserModel user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthUpdateUser) {
          try {
            if (state is AuthSuccess) {
              final updatedUser = (state as AuthSuccess).user.copyWith(
                    username: event.data.username,
                    name: event.data.name,
                    email: event.data.email,
                    password: event.data.password,
                  );
              emit(AuthLoading());

              await UserService().updateUser(event.data);

              emit(AuthSuccess(updatedUser));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthUpdatePin) {
          try {
            if (state is AuthSuccess) {
              final updatedPin = (state as AuthSuccess).user.copyWith(
                    pin: event.newPin,
                  );
              emit(AuthLoading());

              await WalletServices().updatePin(
                event.oldPin,
                event.newPin,
              );

              emit(AuthSuccess(updatedPin));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogout) {
          try {
            emit(AuthLoading());
            await AuthService().logout();
            emit(AuthInitial());
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
  
}
