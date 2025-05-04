class AuthEntity{
  final int id;
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String firstName;
  final String lastName;


  AuthEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.firstName,
    required this.lastName,

  });
}

