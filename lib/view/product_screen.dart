import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/component/network_image.dart';
import 'package:flutter_ecommerce/view/cart_view.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import '../model/item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentShoppingCart cart = PersistentShoppingCart();

  List<ItemModel> itemsList = [
    ItemModel(
      productId: '1',
      productName: 'Fried Fish Burger',
      productDescription: 'Served with fries & coleslaw',
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/642da78b9bac1_Double-Tangy-B.png',
      unitPrice: 30,
    ),
    ItemModel(
      productId: '2',
      productName: 'Loaded Beef Jalapeno',
      productDescription: '200g Premium beef with jalapeno sauce',
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/642da91abab43_Loaded-Chicken-Jalapeno-B.png',
      unitPrice: 30,
    ),
    ItemModel(
      productId: '3',
      productName: 'Crispy Penny Pasta',
      productDescription:
          'Creamy mushroom sauce with three types of bell pepper mushrooms & fried breast fillet',
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/1671690922.png',
      unitPrice: 50,
    ),
    ItemModel(
      productId: '4',
      productName: 'Moroccan Fish',
      productDescription:
          "Fried filet of fish served with Moroccan sauce sided by veggies & choice of side",
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/1671691271.png',
      unitPrice: 20,
    ),
    ItemModel(
      productId: '5',
      productName: 'Creamy Chipotle',
      productDescription: 'Grilled chicken fillet topped with chipotle sauce',
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/6569bee77d7c2_12.png',
      unitPrice: 40,
    ),
    ItemModel(
        productId: '6',
        productName: 'Onion Rings',
        productDescription:
            '10 imported crumbed onion rings served with chilli garlic sauce',
        productThumbnail:
            'https://taytocafe.com/delivery/assets/products/1671634436.png',
        unitPrice: 5),
    ItemModel(
      productId: '7',
      productName: 'Pizza Fries',
      productDescription:
          'French fries topped with chicken chunks & pizza sauce with Nachos & cheese',
      productThumbnail:
          'https://taytocafe.com/delivery/assets/products/1671634207.png',
      unitPrice: 10,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF4E66FF),
        title: const Text(
          'Shopping Cart App',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
            cartItemCountWidgetBuilder: (itemCount) => IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartView(),
                    ));
              },
              icon: Badge(
                label: Text(itemCount.toString()),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              final item = itemsList[index];
              return Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 5),
                      child: Row(
                        children: [
                          NetworkImageWidget(
                            imageUrl: item.productThumbnail,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.productDescription,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      r"$" + item.unitPrice.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    PersistentShoppingCart()
                                        .showAndUpdateCartItemWidget(
                                      inCartWidget: Container(
                                        width: 85,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(0XFF4E66FF)
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Removed',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      notInCartWidget: Container(
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: const Color(0XFF4E66FF)
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white),
                                            ),
                                          )),
                                      product: PersistentShoppingCartItem(
                                        productId: item.productId,
                                        productName: item.productName,
                                        unitPrice: double.parse(
                                            item.unitPrice.toString()),
                                        quantity: 1,
                                        productThumbnail: item.productThumbnail,
                                        productDescription:
                                            item.productDescription,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
