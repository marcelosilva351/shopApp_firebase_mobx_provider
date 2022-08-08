import 'dart:io';

import 'package:app/domain/entities/user_info/user_entity.dart';
import 'package:app/domain/errors/users/change_image_erro.dart';
import 'package:app/domain/errors/users/get_user_erro.dart';
import 'package:app/domain/repositories/iuser_repository.dart';
import 'package:app/infra/data_sources/get_user_data_source.dart';
import 'package:app/infra/dto/user/get_user_dto.dart';

class UserRepository implements IUserRepository {
  late IGetUserDataSource _getUserDataSource;
  UserRepository(IGetUserDataSource getUserDataSource) {
    _getUserDataSource = getUserDataSource;
  }

  @override
  Future<UserEntity> getUser(String email) async {
    try {
      Map user = await _getUserDataSource.getUser(email);
      GetUsetDto userDto = GetUsetDto.fromJson(user);
      return userDto;
    } on GetUserErro catch (e) {
      throw GetUserErro(e.message);
    }
  }

  @override
  Future<bool> changeImage(File image, String email) async {
    try {
      return await _getUserDataSource.changeImage(image, email);
    } on ChangeImageErro catch (e) {
      throw ChangeImageErro(e.message);
    }
  }
}
