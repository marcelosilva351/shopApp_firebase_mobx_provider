import 'package:app/domain/entities/auth/login_entity.dart';
import 'package:app/domain/errors/auth/login_user_exception.dart';
import 'package:app/domain/repositories/iauth_repository.dart';
import 'package:app/domain/use_cases/auth/interfaces/ilogin_user_use_case.dart';

class LoginUserUseCase implements ILoginUserUseCase {
  late IAuthRepository _authRepository;
  LoginUserUseCase(IAuthRepository authRepository) {
    _authRepository = authRepository;
  }

  @override
  Future<bool> loginUser(LoginEntity loginEntity) {
    try {
      return _authRepository.loginUser(loginEntity);
    } on LoginUserException catch (e) {
      throw LoginUserException(e.message);
    }
  }
}
