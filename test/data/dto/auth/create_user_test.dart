import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/infra/dto/create_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("check to json create user", () {
    var user = CreateUserEntity("email", "", "");
    CreateUserDto createUser =
        CreateUserDto(user.email, user.password, user.confirmPassword);
    Map userMap = createUser.toJson();
    expect("email", userMap["email"]);
  });
}
