// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$createUserResultAtom =
      Atom(name: '_AuthControllerBase.createUserResult', context: context);

  @override
  String get createUserResult {
    _$createUserResultAtom.reportRead();
    return super.createUserResult;
  }

  @override
  set createUserResult(String value) {
    _$createUserResultAtom.reportWrite(value, super.createUserResult, () {
      super.createUserResult = value;
    });
  }

  late final _$isLoadingCreateUserAtom =
      Atom(name: '_AuthControllerBase.isLoadingCreateUser', context: context);

  @override
  bool get isLoadingCreateUser {
    _$isLoadingCreateUserAtom.reportRead();
    return super.isLoadingCreateUser;
  }

  @override
  set isLoadingCreateUser(bool value) {
    _$isLoadingCreateUserAtom.reportWrite(value, super.isLoadingCreateUser, () {
      super.isLoadingCreateUser = value;
    });
  }

  late final _$loginResultAtom =
      Atom(name: '_AuthControllerBase.loginResult', context: context);

  @override
  String get loginResult {
    _$loginResultAtom.reportRead();
    return super.loginResult;
  }

  @override
  set loginResult(String value) {
    _$loginResultAtom.reportWrite(value, super.loginResult, () {
      super.loginResult = value;
    });
  }

  late final _$isLoadingLoginAtom =
      Atom(name: '_AuthControllerBase.isLoadingLogin', context: context);

  @override
  bool get isLoadingLogin {
    _$isLoadingLoginAtom.reportRead();
    return super.isLoadingLogin;
  }

  @override
  set isLoadingLogin(bool value) {
    _$isLoadingLoginAtom.reportWrite(value, super.isLoadingLogin, () {
      super.isLoadingLogin = value;
    });
  }

  late final _$getEmailLoginAtom =
      Atom(name: '_AuthControllerBase.getEmailLogin', context: context);

  @override
  String get getEmailLogin {
    _$getEmailLoginAtom.reportRead();
    return super.getEmailLogin;
  }

  @override
  set getEmailLogin(String value) {
    _$getEmailLoginAtom.reportWrite(value, super.getEmailLogin, () {
      super.getEmailLogin = value;
    });
  }

  late final _$createUserAsyncAction =
      AsyncAction('_AuthControllerBase.createUser', context: context);

  @override
  Future createUser(CreateUserEntity createUserEntity) {
    return _$createUserAsyncAction
        .run(() => super.createUser(createUserEntity));
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_AuthControllerBase.loginUser', context: context);

  @override
  Future<bool> loginUser(LoginEntity loginEntity) {
    return _$loginUserAsyncAction.run(() => super.loginUser(loginEntity));
  }

  late final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase', context: context);

  @override
  bool validateCreateUser(CreateUserEntity createUserEntity) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.validateCreateUser');
    try {
      return super.validateCreateUser(createUserEntity);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
createUserResult: ${createUserResult},
isLoadingCreateUser: ${isLoadingCreateUser},
loginResult: ${loginResult},
isLoadingLogin: ${isLoadingLogin},
getEmailLogin: ${getEmailLogin}
    ''';
  }
}
