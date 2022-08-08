import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/entities/auth/login_entity.dart';

abstract class IAuthRepository {
  Future<bool> createUser(CreateUserEntity createUser);
  Future<bool> loginUser(LoginEntity loginEntity);
}
