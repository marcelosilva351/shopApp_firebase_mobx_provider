import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:email_validator/email_validator.dart';

class CreateUserValidator {
  bool allFieldsAreNotNull(CreateUserEntity createUserEntity) {
    if (createUserEntity.email != "" &&
        createUserEntity.password != "" &&
        createUserEntity.confirmPassword != "") {
      return true;
    }
    return false;
  }

  bool checkIfPasswordHasUpperCase(CreateUserEntity createUserEntity) {
    bool containsUppercase =
        createUserEntity.password.contains(RegExp(r'[A-Z]'));
    return containsUppercase;
  }

  bool checkEmail(CreateUserEntity createUserEntity) {
    return EmailValidator.validate(createUserEntity.email);
  }

  bool checkLenghtPassword(CreateUserEntity createUserEntity) {
    if (createUserEntity.password.length < 7) {
      return false;
    }
    return true;
  }
}
