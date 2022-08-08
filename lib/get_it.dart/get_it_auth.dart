import 'package:app/data/data_sources/auth_data_source.dart';
import 'package:app/domain/use_cases/auth/implementations/create_user_use_case.dart';
import 'package:app/domain/use_cases/auth/implementations/login_user_use_case.dart';
import 'package:app/infra/repositories/auth/auth_repository.dart';
import 'package:app/presenter/auth/controllers/auth_controller.dart';
import 'package:get_it/get_it.dart';

class GetItAuth {
  GetIt getIt = GetIt.I;

  GetItAuth() {
    getIt.registerLazySingleton<AuthController>(() => AuthController(
        CreateUserUseCase(AuthRepository(AuthDataSource())),
        LoginUserUseCase(AuthRepository(AuthDataSource()))));
  }
}
