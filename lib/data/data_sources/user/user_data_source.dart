import 'dart:io';

import 'package:app/domain/errors/users/change_image_erro.dart';
import 'package:app/domain/errors/users/get_user_erro.dart';
import 'package:app/infra/data_sources/get_user_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserDataSource implements IGetUserDataSource {
  var firestore = FirebaseFirestore.instance;
  var storage = FirebaseStorage.instance;

  @override
  Future<Map> getUser(String email) async {
    try {
      var userFromFirebase =
          await firestore.collection("users").doc(email).get();
      var usermap = userFromFirebase.data();
      return {"email": usermap!["email"], "img": usermap["img"]};
    } catch (e) {
      throw GetUserErro("Erro ao buscar o usuario");
    }
  }

  @override
  Future<bool> changeImage(File image, String email) async {
    return await storage.ref(email).putFile(image).then((p0) async {
      var userFromFirebase = await firestore.collection("users").doc(email).set(
          {"email": email, "img": await storage.ref(email).getDownloadURL()});
      return true;
    }).catchError(
        (e) => throw ChangeImageErro("Erro ao adicionar foto de perfil"));
  }
}
