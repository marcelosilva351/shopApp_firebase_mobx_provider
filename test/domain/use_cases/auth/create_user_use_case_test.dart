import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/entities/auth/login_entity.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/domain/errors/auth/diferent_passwords_exception.dart';
import 'package:app/domain/errors/auth/no_uppercase_password.dart';
import 'package:app/domain/repositories/iauth_repository.dart';
import 'package:app/domain/use_cases/auth/implementations/create_user_use_case.dart';
import 'package:app/domain/use_cases/auth/interfaces/icreate_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ICreateUserUseCase createUserUseCase = CreateUserUseCase(mockRepository());
  ICreateUserUseCase createUserUseCaseFailed =
      CreateUserUseCase(mockRepositoryFailed());

  test("check password is equal", () async {
    var user = CreateUserEntity("", "s", "d");
    var result = false;
    try {
      var resultCreate = await createUserUseCase.createUser(user);
    } on DiferentPasswordException {
      result = true;
    }
    expect(true, result);
  });

  test("check password has upperCase", () async {
    var user = CreateUserEntity("", "s", "s");
    var resultDiferentPassword = false;
    var resultNoUppeCase = false;
    try {
      var resultCreate = await createUserUseCase.createUser(user);
    } on DiferentPasswordException {
      resultDiferentPassword = true;
    } on NoUpperCasePassword {
      resultNoUppeCase = true;
    }
    expect(true, resultNoUppeCase == true && resultDiferentPassword == false);
  });

  test("create user", () async {
    var user = CreateUserEntity("marcelin@gmail.com", "S", "S");
    var result = await createUserUseCase.createUser(user);
    expect(true, result);
  });
  test("create user exception", () async {
    var user = CreateUserEntity("marcelin@gmail.com", "S", "S");
    var exceptionCreate = false;

    try {
      var result = await createUserUseCaseFailed.createUser(user);
    } on CreateUserException {
      exceptionCreate = true;
    }
    expect(true, exceptionCreate);
  });
}

class mockRepository implements IAuthRepository {
  @override
  Future<bool> createUser(CreateUserEntity) async {
    return true;
  }

  @override
  Future<bool> loginUser(LoginEntity loginEntity) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}

class mockRepositoryFailed implements IAuthRepository {
  @override
  Future<bool> createUser(CreateUserEntity) async {
    throw CreateUserException("Erro");
  }

  @override
  Future<bool> loginUser(LoginEntity loginEntity) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}
