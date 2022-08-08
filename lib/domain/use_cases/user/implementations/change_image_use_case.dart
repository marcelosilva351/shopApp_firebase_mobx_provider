import 'dart:io';

import 'package:app/domain/errors/users/change_image_erro.dart';
import 'package:app/domain/repositories/iuser_repository.dart';
import 'package:app/domain/use_cases/user/interfaces/ichange_image_use_case.dart';

class ChangeImageUseCase implements IChangeImageUseCase {
  late IUserRepository _userRepository;
  ChangeImageUseCase(IUserRepository userRepository) {
    _userRepository = userRepository;
  }

  @override
  Future<bool> chengeImage(File image, String email) async {
    try {
      return _userRepository.changeImage(image, email);
    } on ChangeImageErro catch (e) {
      throw ChangeImageErro(e.message);
    }
  }
}
