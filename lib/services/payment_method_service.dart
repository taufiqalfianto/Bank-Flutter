import 'dart:convert';

import 'package:bank/models/payment_method_model,.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.get(
        Uri.parse(
          '$baseurl/payment_methods',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        return List<PaymentMethodModel>.from(
          jsonDecode(response.body).map(
            (PaymentMethod) =>
                PaymentMethodModel.fromJson(PaymentMethod),
          ),
        ).toList();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
