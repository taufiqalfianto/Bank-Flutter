class SignInFormModel {
  final String? email;
  final String? password;

  SignInFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> tojson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
