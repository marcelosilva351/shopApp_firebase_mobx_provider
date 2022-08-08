import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/entities/auth/login_entity.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/domain/errors/auth/login_user_exception.dart';
import 'package:app/domain/use_cases/auth/interfaces/icreate_user_use_case.dart';
import 'package:app/domain/use_cases/auth/interfaces/ilogin_user_use_case.dart';
import 'package:app/presenter/auth/validators/create_user_validator.dart';
import 'package:app/presenter/auth/validators/login_user_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  CreateUserValidator createUserValidator = CreateUserValidator();

  late ICreateUserUseCase _createUserUseCase;
  late ILoginUserUseCase _loginUserUseCase;

  _AuthControllerBase(ICreateUserUseCase createUserUseCase,
      ILoginUserUseCase loginUserUseCase) {
    _createUserUseCase = createUserUseCase;
    _loginUserUseCase = loginUserUseCase;
  }

  @observable
  String createUserResult = "";

  @observable
  bool isLoadingCreateUser = false;

  @action
  createUser(CreateUserEntity createUserEntity) async {
    if (!validateCreateUser(createUserEntity)) {
      return;
    }
    createUserResult = "";
    try {
      var result = await _createUserUseCase.createUser(createUserEntity);
      if (result) {
        createUserResult = "Cadastrado com sucesso!";
        isLoadingCreateUser = false;
      } else {
        createUserResult = "Ocorreu um erro!";
        isLoadingCreateUser = false;
      }
    } on CreateUserException catch (e) {
      createUserResult = e.message;
      isLoadingCreateUser = false;
    }
  }

  @action
  bool validateCreateUser(CreateUserEntity createUserEntity) {
    isLoadingCreateUser = true;
    if (!createUserValidator.allFieldsAreNotNull(createUserEntity)) {
      isLoadingCreateUser = false;
      createUserResult = "Voce não digitou todos os campos";
      return false;
    }
    if (!createUserValidator.checkIfPasswordHasUpperCase(createUserEntity)) {
      isLoadingCreateUser = false;
      createUserResult = "A senha precisa de uma letra maiuscula";
      return false;
    }
    if (!createUserValidator.checkEmail(createUserEntity)) {
      isLoadingCreateUser = false;
      createUserResult = "Email invalido";
      return false;
    }
    if (!createUserValidator.checkLenghtPassword(createUserEntity)) {
      isLoadingCreateUser = false;
      createUserResult = "Sua senha precisa ter no minimo 6 caracteres";
      return false;
    }
    return true;
  }

  //login

  @observable
  String loginResult = "";

  @observable
  bool isLoadingLogin = false;

  @observable
  String getEmailLogin = "";
  @action
  Future<bool> loginUser(LoginEntity loginEntity) async {
    try {
      isLoadingLogin = true;
      bool resultLogin = await _loginUserUseCase.loginUser(loginEntity);
      if (resultLogin) {
        loginResult = "Logado";
        isLoadingLogin = false;
        getEmailLogin = loginEntity.email;
        return true;
      }
      isLoadingLogin = false;
      return false;
    } on LoginUserException catch (e) {
      isLoadingLogin = false;
      loginResult = e.message;
    }
    return false;
  }
}
