import 'package:app/data/data_sources/iauth_data_source.dart';
import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/entities/auth/login_entity.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/domain/errors/auth/login_user_exception.dart';
import 'package:app/domain/repositories/iauth_repository.dart';
import 'package:app/infra/dto/create_user_dto.dart';
import 'package:app/infra/dto/login_user_dto.dart';

class AuthRepository implements IAuthRepository {
  late IAuthDataSource _authDataSource;
  AuthRepository(IAuthDataSource authDataSource) {
    _authDataSource = authDataSource;
  }

  @override
  Future<bool> createUser(CreateUserEntity createUser) async {
    try {
      var createUserDto = CreateUserDto(
          createUser.email, createUser.password, createUser.confirmPassword);
      var decode = await _authDataSource.createUser(createUserDto.toJson());
      return decode;
    } on CreateUserException catch (e) {
      throw CreateUserException(e.message);
    }
  }

  @override
  Future<bool> loginUser(LoginEntity loginEntity) async {
    try {
      var loginUserDto = LoginUserDto(loginEntity.email, loginEntity.password);
      var resultFromDataSource =
          await _authDataSource.loginUser(loginUserDto.toJson());
      return resultFromDataSource;
    } on LoginUserException catch (e) {
      throw LoginUserException(e.message);
    }
  }
}
