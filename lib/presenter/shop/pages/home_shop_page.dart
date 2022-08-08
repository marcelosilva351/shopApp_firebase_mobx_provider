import 'package:app/presenter/auth/controllers/auth_controller.dart';
import 'package:app/presenter/shop/cart_page.dart';
import 'package:app/presenter/shop/controller/cloth_controller.dart';
import 'package:app/presenter/shop/pages/cloth_page.dart';
import 'package:app/presenter/user/user_controller.dart';
import 'package:app/shared/screen_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePageShop extends StatefulWidget {
  @override
  State<HomePageShop> createState() => _HomePageShopState();
}

class _HomePageShopState extends State<HomePageShop> {
  @override
  Widget build(BuildContext context) {
    UserController userController =
        Provider.of<UserController>(context, listen: true);
    userController.getUser();
    ClothController clothController =
        Provider.of<ClothController>(context, listen: true);
    userController.getUser();
    clothController.getClothSellest();
    clothController.getCartLeng();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenSize.getWidth(context) * 0.05,
                  right: ScreenSize.getWidth(context) * 0.05),
              child: Row(
                children: [
                  Observer(builder: (context) {
                    if (userController.user!.status == FutureStatus.pending) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    }
                    if (userController.user!.value!.img == "no image") {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/user");
                        },
                        child: Container(
                            width: ScreenSize.getWidth(context) * 0.15,
                            height: ScreenSize.getHeight(context) * 0.65,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.orange,
                            )),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/user");
                      },
                      child: Container(
                        width: ScreenSize.getWidth(context) * 0.15,
                        height: ScreenSize.getHeight(context) * 0.65,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    userController.user!.value!.img),
                                fit: BoxFit.cover)),
                      ),
                    );
                  }),
                  SizedBox(width: ScreenSize.getWidth(context) * 0.2),
                  Row(
                    children: const [
                      Text(
                        "Shop",
                        style: TextStyle(color: Colors.orange, fontSize: 22),
                      ),
                      Text(
                        "App",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(width: ScreenSize.getWidth(context) * 0.25),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          clothController.getCart();
                          await Future.delayed(Duration(milliseconds: 800));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      Observer(builder: (context) {
                        return Text(clothController.cartLegh.toString());
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 2),
                    image: DecorationImage(
                        image: AssetImage("images/tshirt.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 2),
                    image: DecorationImage(
                        image: AssetImage("images/sneaker.png"),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 2),
                    image: DecorationImage(
                        image: AssetImage(
                      "images/pants.png",
                    ))),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children: [
                Text(
                  "Mais vendidos",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          Observer(builder: (context) {
            if (clothController.clothSellest!.status == FutureStatus.pending) {
              return Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            }
            return Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: clothController.clothSellest!.value!.length,
                  itemBuilder: (context, index) {
                    var cloth = clothController.clothSellest!.value![index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ClothPage(cloth);
                              }));
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(cloth.img),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Row(
                            children: [
                              Text(cloth.name),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "U\$${cloth.value}",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
