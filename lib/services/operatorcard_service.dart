import 'dart:convert';

import 'package:bank/models/operator_card_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class OperatorCardService {
  Future<List<OperatorCardModel>> getoperatorcard() async {
    try {
      final token = await AuthService().gettoken();

      final response = await http.get(
        Uri.parse('$baseurl/operator_cards'),
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        List<OperatorCardModel> operators = List<OperatorCardModel>.from(
          jsonDecode(response.body)['data'].map(
            (operatorCard) => OperatorCardModel.fromJson(operatorCard),
          ),
        ).toList();

        return operators;
      }
      return throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
