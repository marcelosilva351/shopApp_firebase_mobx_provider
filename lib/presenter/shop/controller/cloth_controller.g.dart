// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClothController on _ClothControllerBase, Store {
  late final _$clothSellestAtom =
      Atom(name: '_ClothControllerBase.clothSellest', context: context);

  @override
  ObservableFuture<List<ClothEntity>>? get clothSellest {
    _$clothSellestAtom.reportRead();
    return super.clothSellest;
  }

  @override
  set clothSellest(ObservableFuture<List<ClothEntity>>? value) {
    _$clothSellestAtom.reportWrite(value, super.clothSellest, () {
      super.clothSellest = value;
    });
  }

  late final _$cartLeghAtom =
      Atom(name: '_ClothControllerBase.cartLegh', context: context);

  @override
  int get cartLegh {
    _$cartLeghAtom.reportRead();
    return super.cartLegh;
  }

  @override
  set cartLegh(int value) {
    _$cartLeghAtom.reportWrite(value, super.cartLegh, () {
      super.cartLegh = value;
    });
  }

  late final _$getCartLengAsyncAction =
      AsyncAction('_ClothControllerBase.getCartLeng', context: context);

  @override
  Future getCartLeng() {
    return _$getCartLengAsyncAction.run(() => super.getCartLeng());
  }

  late final _$addClothAsyncAction =
      AsyncAction('_ClothControllerBase.addCloth', context: context);

  @override
  Future addCloth(ClothEntity cloth) {
    return _$addClothAsyncAction.run(() => super.addCloth(cloth));
  }

  late final _$_ClothControllerBaseActionController =
      ActionController(name: '_ClothControllerBase', context: context);

  @override
  dynamic getClothSellest() {
    final _$actionInfo = _$_ClothControllerBaseActionController.startAction(
        name: '_ClothControllerBase.getClothSellest');
    try {
      return super.getClothSellest();
    } finally {
      _$_ClothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clothSellest: ${clothSellest},
cartLegh: ${cartLegh}
    ''';
  }
}
