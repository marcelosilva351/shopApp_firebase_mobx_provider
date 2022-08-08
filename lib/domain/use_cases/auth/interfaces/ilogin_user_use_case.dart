import 'package:app/domain/entities/auth/login_entity.dart';

abstract class ILoginUserUseCase {
  Future<bool> loginUser(LoginEntity loginEntity);
}
