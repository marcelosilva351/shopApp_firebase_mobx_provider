import 'package:app/domain/entities/auth/create_user_entity.dart';

abstract class ICreateUserUseCase {
  Future<bool> createUser(CreateUserEntity createUserEntity);
}
