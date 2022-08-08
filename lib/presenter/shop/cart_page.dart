import 'package:app/presenter/shop/controller/cloth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    ClothController repo = Provider.of<ClothController>(context, listen: true);

    double getTotal() {
      double returnValue = 0;
      for (var value in repo.cart) {
        returnValue += value.value;
      }
      return returnValue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
              width: 300,
              height: 400,
              child: ListView.builder(
                itemCount: repo.cart.length,
                itemBuilder: (context, index) {
                  var cartIndex = repo.cart[index];
                  return ListTile(
                      title: Text(cartIndex.name),
                      subtitle: Text("U\$ ${cartIndex.value}"));
                },
              )),
          Center(child: Text("Total: ${getTotal().toString()}"))
        ],
      ),
    );
  }
}
