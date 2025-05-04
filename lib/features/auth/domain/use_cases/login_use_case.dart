import 'package:sadeem/features/auth/domain/entities/auth_entity.dart';
import 'package:sadeem/features/auth/domain/repository/auth_repository.dart';

class LoginUserCase {
  final AuthRepository repository;

  LoginUserCase(this.repository);

  Future<AuthEntity> call(String username, String password) async {
    return await repository.loginUser(username, password);
  }
}
