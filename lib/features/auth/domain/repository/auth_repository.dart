import '../entities/auth_entity.dart';

abstract class AuthRepository {
  //3 possible scenarios to implement
  Future<AuthEntity> loginUser(String username, String password);

  Future<AuthEntity> getCurrentUser();

  Future<void> logout();

}