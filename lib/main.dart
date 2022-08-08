import 'package:app/data/data_sources/auth_data_source.dart';
import 'package:app/data/data_sources/cloth/cloth_datasouce.dart';
import 'package:app/data/data_sources/user/user_data_source.dart';
import 'package:app/domain/repositories/iget_cart_repository.dart';
import 'package:app/domain/use_cases/auth/implementations/create_user_use_case.dart';
import 'package:app/domain/use_cases/auth/implementations/login_user_use_case.dart';
import 'package:app/domain/use_cases/cart/get_cart_use_case.dart';
import 'package:app/domain/use_cases/cloth/implementations/get_sellest_cloth_use_case.dart';
import 'package:app/domain/use_cases/user/implementations/change_image_use_case.dart';
import 'package:app/domain/use_cases/user/implementations/get_user_use_case.dart';
import 'package:app/get_it.dart/get_all.dart';
import 'package:app/infra/repositories/auth/auth_repository.dart';
import 'package:app/infra/repositories/cart_repository.dart';
import 'package:app/infra/repositories/cloth/cloth_repository.dart';
import 'package:app/infra/repositories/user/user_repository.dart';
import 'package:app/presenter/auth/controllers/auth_controller.dart';
import 'package:app/presenter/auth/pages/create_user_page.dart';
import 'package:app/presenter/auth/pages/login_user_page.dart';
import 'package:app/presenter/shop/controller/cloth_controller.dart';
import 'package:app/presenter/shop/pages/home_shop_page.dart';
import 'package:app/presenter/user/pages/user_page.dart';
import 'package:app/presenter/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [
        Provider<UserController>(
          create: (context) => UserController(
              GetUserUseCase(UserRepository(UserDataSource())),
              ChangeImageUseCase(UserRepository(UserDataSource()))),
        ),
        Provider<AuthController>(
            create: (context) => AuthController(
                CreateUserUseCase(AuthRepository(AuthDataSource())),
                LoginUserUseCase(AuthRepository(AuthDataSource())))),
        Provider<ClothController>(
            create: (context) => ClothController(
                GetSellestClothUserCase(ClothRepository(ClothDataSource())),
                GetCartUseCase(GetCartRepository())))
      ],
      child: MaterialApp(initialRoute: '/', routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => CreateUserPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginUserPage(),
        '/home': (context) => HomePageShop(),
        '/user': (context) => UserPage(),
      })));
}
