class UserModel {
  final String? name;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final String? emailVerifiedAt;
  final int? verified;
  final String? profilePicture;
  final String? ktp;
  final String? createdAt;
  final String? updatedAt;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;
  final int? tokenExpiresIn;
  final String? tokenType;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.password,
      this.emailVerifiedAt,
      this.verified,
      this.profilePicture,
      this.ktp,
      this.createdAt,
      this.updatedAt,
      this.balance,
      this.cardNumber,
      this.pin,
      this.token,
      this.tokenExpiresIn,
      this.tokenType});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        emailVerifiedAt: json['email_verified_at'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        ktp: json['ktp'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
        tokenExpiresIn: json['token_expires_in'],
        tokenType: json['token_type'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    String? ktp,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        emailVerifiedAt: emailVerifiedAt,
        verified: verified,
        profilePicture: profilePicture,
        ktp: ktp ?? this.ktp,
        createdAt: createdAt,
        updatedAt: updatedAt,
        balance: balance ?? this.balance,
        cardNumber: cardNumber,
        pin: pin ?? this.pin,
        token: token,
        tokenExpiresIn: tokenExpiresIn,
        tokenType: tokenType,
      );
}
