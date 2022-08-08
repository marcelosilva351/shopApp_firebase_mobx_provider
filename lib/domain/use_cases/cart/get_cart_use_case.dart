import 'package:app/domain/entities/cart/cart_entity.dart';
import 'package:app/domain/repositories/iget_cart_repository.dart';
import 'package:app/domain/use_cases/cart/iget_cart_use_case.dart';

class GetCartUseCase implements IGetCartUseCase {
  late IGetCartRepository _getCartRepository;
  GetCartUseCase(IGetCartRepository getCartRepository) {
    _getCartRepository = getCartRepository;
  }
  @override
  Future<List<CartEntity>> getCart(String email) {
    return _getCartRepository.getCartUser(email);
  }
}
