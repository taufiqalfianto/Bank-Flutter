import 'package:bank/models/payment_method_model,.dart';
import 'package:bank/services/payment_method_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMethodLoading());
          final PaymentMethod =
              await PaymentMethodService().getPaymentMethods();

          emit(PaymentMethodSucces(PaymentMethod));
        } catch (e) {
          emit(
            PaymentMethodfailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
