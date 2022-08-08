import 'package:app/domain/entities/cart/cart_entity.dart';

abstract class IGetCartUseCase {
  Future<List<CartEntity>> getCart(String email);
}
