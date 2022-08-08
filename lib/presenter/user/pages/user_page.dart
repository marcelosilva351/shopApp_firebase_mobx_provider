import 'package:app/presenter/user/user_controller.dart';
import 'package:app/shared/screen_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    UserController userController =
        Provider.of<UserController>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "Meu Perfil",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Observer(builder: (context) {
          if (userController.isLoadingChangeimage) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (userController.user!.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (userController.user!.status == FutureStatus.rejected) {
            return Center(
                child: Column(
              children: const [
                Text("Ocorreu um erro ao buscar o seu usuario"),
                Icon(
                  Icons.error,
                  color: Colors.red,
                )
              ],
            ));
          }
          if (userController.user!.value!.img == "no image") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final XFile? image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) async {
                        if (value == null) {
                          return;
                        }
                        await userController.changeImage(
                            value.path,
                            FirebaseAuth.instance.currentUser!.email
                                .toString());
                      });
                    },
                    child: Container(
                        width: ScreenSize.getWidth(context) * 0.4,
                        height: ScreenSize.getHeight(context) * 0.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange)),
                        child: const Center(
                            child: Icon(
                          Icons.person_add,
                          color: Colors.orange,
                          size: 90,
                        ))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(userController.user!.value!.email),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenSize.getWidth(context) * 0.1,
                      right: ScreenSize.getWidth(context) * 0.1),
                  child: Container(
                    height: ScreenSize.getHeight(context) * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(1, 2)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        "Conferir loja",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenSize.getWidth(context) * 0.1,
                      right: ScreenSize.getWidth(context) * 0.1),
                  child: Container(
                    height: ScreenSize.getHeight(context) * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(1, 2)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        "Conferir Carrinho",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) async {
                      if (value == null) {
                        return;
                      }
                      await userController.changeImage(value.path,
                          FirebaseAuth.instance.currentUser!.email.toString());
                      userController.getUser();
                    });
                  },
                  child: Container(
                    width: ScreenSize.getWidth(context) * 0.4,
                    height: ScreenSize.getHeight(context) * 0.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.orange),
                        image: DecorationImage(
                            image:
                                NetworkImage(userController.user!.value!.img),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(userController.user!.value!.email),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenSize.getWidth(context) * 0.1,
                    right: ScreenSize.getWidth(context) * 0.1),
                child: Container(
                  height: ScreenSize.getHeight(context) * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black54,
                            offset: Offset(1, 2)),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(
                      "Conferir loja",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenSize.getWidth(context) * 0.1,
                    right: ScreenSize.getWidth(context) * 0.1),
                child: Container(
                  height: ScreenSize.getHeight(context) * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black54,
                            offset: Offset(1, 2)),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(
                      "Conferir Carrinho",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
