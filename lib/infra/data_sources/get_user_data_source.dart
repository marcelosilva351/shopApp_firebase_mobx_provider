import 'dart:io';

import 'package:app/infra/dto/user/get_user_dto.dart';

abstract class IGetUserDataSource {
  Future<Map> getUser(String email);
  Future<bool> changeImage(File image, String email);
}
