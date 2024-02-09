import 'dart:convert';

import 'package:bank/models/tips_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TipsService {
  Future<List<TipsModel>> gettips() async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.get(
        Uri.parse(
          '$baseurl/tips',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        List<TipsModel> tips = List<TipsModel>.from(
          jsonDecode(response.body)['data'].map(
            (tips) => TipsModel.fromJson(tips),
          ),
        ).toList();

        return tips;
      }
      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
