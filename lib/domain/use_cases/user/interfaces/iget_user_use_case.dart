import 'package:app/domain/entities/user_info/user_entity.dart';

abstract class IGetUserUseCase {
  Future<UserEntity> getUser(String email);
}
