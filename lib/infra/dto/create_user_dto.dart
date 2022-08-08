import 'package:app/domain/entities/auth/create_user_entity.dart';

class CreateUserDto extends CreateUserEntity {
  CreateUserDto(String email, String password, String confirmPassword)
      : super(email, password, confirmPassword);

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };
  }
}
