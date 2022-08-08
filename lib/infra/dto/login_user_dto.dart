import 'package:app/domain/entities/auth/login_entity.dart';

class LoginUserDto extends LoginEntity {
  LoginUserDto(String email, String password) : super(email, password);

  Map<String, dynamic> toJson() {
    return {"email": email, "passowrd": password};
  }
}
