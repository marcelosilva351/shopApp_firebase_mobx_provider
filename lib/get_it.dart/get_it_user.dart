import 'package:app/data/data_sources/auth_data_source.dart';
import 'package:app/data/data_sources/user/user_data_source.dart';
import 'package:app/domain/use_cases/auth/implementations/create_user_use_case.dart';
import 'package:app/domain/use_cases/auth/implementations/login_user_use_case.dart';
import 'package:app/domain/use_cases/user/implementations/change_image_use_case.dart';
import 'package:app/domain/use_cases/user/implementations/get_user_use_case.dart';
import 'package:app/infra/repositories/auth/auth_repository.dart';
import 'package:app/infra/repositories/user/user_repository.dart';
import 'package:app/presenter/auth/controllers/auth_controller.dart';
import 'package:app/presenter/user/user_controller.dart';
import 'package:get_it/get_it.dart';

class GetItUser {
  GetIt getIt = GetIt.I;

  GetItUser() {
    getIt.registerSingleton<UserRepository>(UserRepository(UserDataSource()));
    getIt.registerLazySingleton<UserController>(() => UserController(
        GetUserUseCase(GetIt.I.get<UserRepository>()),
        ChangeImageUseCase(GetIt.I.get<UserRepository>())));
  }
}
