import 'package:app/domain/entities/cart/cart_entity.dart';

abstract class IGetCartRepository {
  Future<List<CartEntity>> getCartUser(String email);
}
