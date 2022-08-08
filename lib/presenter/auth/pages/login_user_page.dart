import 'package:app/domain/entities/auth/create_user_entity.dart';
import 'package:app/domain/entities/auth/login_entity.dart';
import 'package:app/infra/repositories/auth/auth_repository.dart';
import 'package:app/presenter/auth/controllers/auth_controller.dart';
import 'package:app/presenter/auth/widgets/input_widget.dart';
import 'package:app/shared/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginUserPage extends StatelessWidget {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordConfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthController authController =
        Provider.of<AuthController>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.getHeight(context) * 0.05),
        child: Container(
          child: ListView(children: [
            Icon(
              Icons.shopping_bag_rounded,
              color: Colors.orange,
              size: ScreenSize.getHeight(context) * 0.15,
            ),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Shop",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 35,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  "App",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.1,
            ),
            InputWidget(Icons.person, "Email", controllerEmail),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.02,
            ),
            InputWidget(Icons.lock, "Senha", controllerPassword),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.02,
            ),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.02,
            ),
            GestureDetector(
              onTap: () async {
                var result = await authController.loginUser(
                    LoginEntity(controllerEmail.text, controllerPassword.text));
                if (result) {
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Container(
                width: double.infinity,
                height: ScreenSize.getHeight(context) * 0.075,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(1, 2))
                    ]),
                child: const Center(
                  child: Text(
                    "Logar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.04,
            ),
            Observer(builder: (context) {
              if (authController.isLoadingLogin) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.orange[800]),
                );
              }
              return Text(authController.loginResult);
            }),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.04,
            ),
          ]),
        ),
      ),
    );
  }
}
