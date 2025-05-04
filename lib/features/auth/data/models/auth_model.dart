import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
   AuthModel({
    required int id,
    required String username,
    required String email,
    required String accessToken,
    required String refreshToken,
    required String firstName,
    required String lastName,
  }) : super(
    id: id,
    username: username,
    email: email,
    accessToken: accessToken,
    refreshToken: refreshToken,
    firstName: firstName,
    lastName: lastName,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] ?? 0,
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}