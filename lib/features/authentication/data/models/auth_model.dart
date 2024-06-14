class AuthModel {
  String accessToken;
  String tokenType;
  num expiresIn;

  AuthModel({
    required this.accessToken,
    required this.tokenType,
    this.expiresIn = 210000,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }
}
