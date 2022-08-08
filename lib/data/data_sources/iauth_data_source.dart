import 'package:app/infra/dto/create_user_dto.dart';

abstract class IAuthDataSource {
  Future<bool> createUser(Map<String, dynamic> createUserDto);
  Future<bool> loginUser(Map<String, dynamic> loginUserDto);
}
