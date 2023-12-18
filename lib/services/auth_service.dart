import 'dart:convert';

import 'package:bank/models/sign_in_form_model.dart';
import 'package:bank/models/sign_up_form_model.dart';
import 'package:bank/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bank/shared/shared_values.dart';

class AuthService {
  Future<bool> checkemail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/is-email-exist'),
        body: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['is_email_exist'];
      } else {
        return jsonDecode(response.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseurl/register',
        ),
        body: data.toJson(),
      );
      print(data.toJson());
      print(res.body);
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/login'),
        body: data.tojson(),
      );
      print(response.body);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        user = user.copyWith(password: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await gettoken();
      final response = await http.post(
        Uri.parse('$baseurl/logout'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        await clearStorage();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentials(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> gettoken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? values = await storage.read(key: 'token');

    if (values != null) {
      token = 'Bearer ' + values;
    }

    return token;
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
