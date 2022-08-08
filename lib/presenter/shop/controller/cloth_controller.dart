import 'package:app/domain/entities/cart/cart_entity.dart';
import 'package:app/domain/entities/cloth/cloth_entity.dart';
import 'package:app/domain/use_cases/cart/iget_cart_use_case.dart';
import 'package:app/domain/use_cases/cloth/interfaces/iget_sellest_cloth_use_case.dart';
import 'package:app/infra/repositories/cart_repository.dart';
import 'package:app/infra/repositories/cloth/cloth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'cloth_controller.g.dart';

class ClothController = _ClothControllerBase with _$ClothController;

abstract class _ClothControllerBase with Store {
  late IGetCartUseCase _getCartUseCase;
  late IGetSellestClothUseCase _getSellestClothUseCase;
  _ClothControllerBase(IGetSellestClothUseCase getSellestClothUseCase,
      IGetCartUseCase getCartUseCase) {
    _getSellestClothUseCase = getSellestClothUseCase;
    _getCartUseCase = getCartUseCase;
  }
  @observable
  ObservableFuture<List<ClothEntity>>? clothSellest;

  @action
  getClothSellest() {
    clothSellest = ObservableFuture(_getSellestClothUseCase.clothsSellest());
  }

  @observable
  int cartLegh = 0;

  @action
  getCartLeng() async {
    var cartList = await _getCartUseCase
        .getCart(FirebaseAuth.instance.currentUser!.email!);
    cartLegh = cartList.length;
  }

  List<CartEntity> cart = [];

  getCart() async {
    cart = await _getCartUseCase
        .getCart(FirebaseAuth.instance.currentUser!.email!);
  }

  var repo = GetCartRepository();
  @action
  addCloth(ClothEntity cloth) async {
    CartEntity cart = CartEntity(cloth.name, cloth.value);
    await repo.addCard(FirebaseAuth.instance.currentUser!.email!, cart);
    await getCartLeng();
  }
}
