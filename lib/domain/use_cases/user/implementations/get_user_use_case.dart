import 'package:app/domain/entities/user_info/user_entity.dart';
import 'package:app/domain/errors/users/get_user_erro.dart';
import 'package:app/domain/repositories/iuser_repository.dart';
import 'package:app/domain/use_cases/user/interfaces/iget_user_use_case.dart';

class GetUserUseCase implements IGetUserUseCase {
  late IUserRepository _userRepository;
  GetUserUseCase(IUserRepository UserRepository) {
    _userRepository = UserRepository;
  }
  @override
  Future<UserEntity> getUser(String email) {
    try {
      return _userRepository.getUser(email);
    } on GetUserErro catch (e) {
      throw GetUserErro(e.message);
    }
  }
}
