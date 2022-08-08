// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_UserControllerBase.user', context: context);

  @override
  ObservableFuture<UserEntity>? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableFuture<UserEntity>? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$resultChangeImageAtom =
      Atom(name: '_UserControllerBase.resultChangeImage', context: context);

  @override
  String get resultChangeImage {
    _$resultChangeImageAtom.reportRead();
    return super.resultChangeImage;
  }

  @override
  set resultChangeImage(String value) {
    _$resultChangeImageAtom.reportWrite(value, super.resultChangeImage, () {
      super.resultChangeImage = value;
    });
  }

  late final _$isLoadingChangeimageAtom =
      Atom(name: '_UserControllerBase.isLoadingChangeimage', context: context);

  @override
  bool get isLoadingChangeimage {
    _$isLoadingChangeimageAtom.reportRead();
    return super.isLoadingChangeimage;
  }

  @override
  set isLoadingChangeimage(bool value) {
    _$isLoadingChangeimageAtom.reportWrite(value, super.isLoadingChangeimage,
        () {
      super.isLoadingChangeimage = value;
    });
  }

  late final _$changeImageAsyncAction =
      AsyncAction('_UserControllerBase.changeImage', context: context);

  @override
  Future changeImage(String file, String email) {
    return _$changeImageAsyncAction.run(() => super.changeImage(file, email));
  }

  late final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase', context: context);

  @override
  dynamic getUser() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
resultChangeImage: ${resultChangeImage},
isLoadingChangeimage: ${isLoadingChangeimage}
    ''';
  }
}
