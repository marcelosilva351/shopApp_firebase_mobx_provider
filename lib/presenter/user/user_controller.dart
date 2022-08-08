import 'dart:io';

import 'package:app/domain/entities/user_info/user_entity.dart';
import 'package:app/domain/errors/users/change_image_erro.dart';
import 'package:app/domain/errors/users/get_user_erro.dart';
import 'package:app/domain/use_cases/user/interfaces/ichange_image_use_case.dart';
import 'package:app/domain/use_cases/user/interfaces/iget_user_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  late IGetUserUseCase _getUserUseCase;
  late IChangeImageUseCase _changeImageUseCase;
  _UserControllerBase(
      IGetUserUseCase getUserUseCase, IChangeImageUseCase changeImageUseCase) {
    _getUserUseCase = getUserUseCase;
    _changeImageUseCase = changeImageUseCase;
  }

  @observable
  ObservableFuture<UserEntity>? user;

  @action
  getUser() {
    try {
      user = ObservableFuture(
          _getUserUseCase.getUser(FirebaseAuth.instance.currentUser!.email!));
    } on GetUserErro catch (e) {
      throw GetUserErro(e.message);
    }
  }

  @observable
  String resultChangeImage = "";

  @observable
  bool isLoadingChangeimage = false;

  @action
  changeImage(String file, String email) async {
    try {
      isLoadingChangeimage = true;
      var result = await _changeImageUseCase.chengeImage(File(file), email);
      if (result) {
        isLoadingChangeimage = false;

        getUser();
      }
    } on ChangeImageErro catch (e) {
      resultChangeImage = e.message;
    }
  }
}
