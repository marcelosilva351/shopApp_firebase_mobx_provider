import 'dart:io';

import 'package:app/domain/entities/user_info/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser(String email);

  Future<bool> changeImage(File image, String email);
}
