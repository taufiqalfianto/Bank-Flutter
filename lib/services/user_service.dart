import 'dart:convert';

import 'package:bank/models/user_edit_form_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:bank/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.put(
        Uri.parse('$baseurl/users'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
