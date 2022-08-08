import 'package:app/domain/entities/cart/cart_entity.dart';
import 'package:app/domain/repositories/iget_cart_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetCartRepository implements IGetCartRepository {
  var firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<CartEntity>> getCartUser(String email) async {
    List<CartEntity> returnCart = [];

    var firebaseCart = await firebaseFirestore
        .collection("users")
        .doc(email)
        .collection("cart")
        .get();
    if (firebaseCart.docs.isEmpty) {
      return returnCart;
    }
    for (var cart in firebaseCart.docs) {
      var cartAdd =
          CartEntity(cart["name"], double.parse(cart["value"].toString()));
      returnCart.add(cartAdd);
    }
    return returnCart;
  }

  addCard(String email, CartEntity cart) async {
    await firebaseFirestore
        .collection("users")
        .doc(email)
        .collection("cart")
        .add({"name": cart.name, "value": cart.value});
  }
}
