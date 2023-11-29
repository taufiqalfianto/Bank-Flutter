import 'dart:convert';

import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class WalletServices {
  Future<void> updatePin(String Oldpin, String Newpin) async {
    try {
      final token = await AuthService().gettoken();
      final response = await http.put(
        Uri.parse('$baseurl/wallets'),
        body: {
          "previous_pin": Oldpin,
          "new_pin": Newpin,
        },
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
