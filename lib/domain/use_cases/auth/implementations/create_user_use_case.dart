import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/domain/repositories/iauth_repository.dart';
import 'package:app/domain/use_cases/auth/interfaces/icreate_user_use_case.dart';

class CreateUserUseCase implements ICreateUserUseCase {
  late IAuthRepository _authRepository;

  CreateUserUseCase(IAuthRepository authRepository) {
    _authRepository = authRepository;
  }

  @override
  Future<bool> createUser(CreateUserEntity createUserEntity) {
    try {
      return _authRepository.createUser(createUserEntity);
    } on CreateUserException catch (e) {
      throw CreateUserException(e.message);
    }
  }
}
