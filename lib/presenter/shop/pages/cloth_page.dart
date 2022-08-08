import 'package:app/domain/entities/cloth/cloth_entity.dart';
import 'package:app/presenter/shop/controller/cloth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClothPage extends StatefulWidget {
  ClothEntity cloth;
  ClothPage(this.cloth);

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ClothController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.cloth.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.cloth.img),
                      fit: BoxFit.cover)),
            ),
          ),
          Text(widget.cloth.name),
          Text("U\$ ${widget.cloth.value}"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                controller.addCloth(widget.cloth);
                setState(() {});
              },
              child: Text("Adicionar carrinho"))
        ],
      ),
    );
  }
}
