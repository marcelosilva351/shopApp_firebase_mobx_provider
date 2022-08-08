import 'dart:convert';

import 'package:app/data/data_sources/iauth_data_source.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/infra/dto/create_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IAuthDataSource _authDatSource = dataSourceMock();
  IAuthDataSource _authDatSourceException = dataSourceMockException();

  test("get a bool from dataSource", () async {
    var createUserDto = CreateUserDto("email", "senha", "confirmar senha");
    var decode = await _authDatSource.createUser(createUserDto.toJson());
    expect(true, decode);
  });

  test("get a exceptino from dataSource", () async {
    var createUserDto = CreateUserDto("email", "senha", "confirmar senha");
    var erro = false;
    try {
      var decode =
          await _authDatSourceException.createUser(createUserDto.toJson());
    } on CreateUserException {
      erro = true;
    }
    expect(true, erro);
  });
}

class dataSourceMock implements IAuthDataSource {
  @override
  Future<bool> createUser(Map<String, dynamic> createUserDto) async {
    var decode = json.encode(createUserDto);
    return true;
  }

  @override
  Future<bool> loginUser(Map<String, dynamic> loginUserDto) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}

class dataSourceMockException implements IAuthDataSource {
  Future<bool> createUser(Map<String, dynamic> createUserDto) async {
    throw CreateUserException("FALHOU");
  }

  @override
  Future<bool> loginUser(Map<String, dynamic> loginUserDto) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}
