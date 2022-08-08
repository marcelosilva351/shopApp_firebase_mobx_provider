import 'package:app/data/data_sources/iauth_data_source.dart';
import 'package:app/domain/errors/auth/create_user_exception.dart';
import 'package:app/domain/errors/auth/login_user_exception.dart';
import 'package:app/infra/dto/create_user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource implements IAuthDataSource {
  var firebaseAuth = FirebaseAuth.instance;
  var cloudInstance = FirebaseFirestore.instance;
  @override
  Future<bool> createUser(Map<String, dynamic> createUserDto) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: createUserDto["email"],
              password: createUserDto["password"])
          .then((value) async {
        await createUserCloudStore(createUserDto["email"], {
          "email": createUserDto["email"],
          "img": "no image"
        }).then((value) => true).catchError(
            (e) => throw CreateUserException("erro ao tentar criar usuario"));
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw CreateUserException("Email já esta em uso");
      }
      throw CreateUserException("Ocorreu um erro ao tentar cadastrar usuario");
    }
  }

  Future<bool> createUserCloudStore(
      String id, Map<String, dynamic> createUserDto) async {
    try {
      await cloudInstance.collection("users").doc(id).set(createUserDto);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> loginUser(Map<String, dynamic> loginUserDto) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: loginUserDto["email"], password: loginUserDto["passowrd"]);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" ||
          e.code == "wrong-password" ||
          e.code == "invalid-email") {
        throw LoginUserException("Email ou senha errados");
      }
      throw LoginUserException("Ocorreu um erro ao tentar logar o usuario");
    }
  }
}
