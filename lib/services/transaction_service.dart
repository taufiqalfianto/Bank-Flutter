import 'dart:convert';

import 'package:bank/models/data_plan_form_model.dart';
import 'package:bank/models/topup_form_model.dart';
import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topup(TopupFormModel data) async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.post(
        Uri.parse(
          '$baseurl/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['redirect_url'];
      }
      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.post(
        Uri.parse(
          '$baseurl/transfers',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<void> dataplan(DataPlanFormModel data) async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.post(
        Uri.parse(
          '$baseurl/data_plans',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
