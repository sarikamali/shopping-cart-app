import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import '../component/network_image.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF4E66FF),
        title: const Text(
          'My Cart',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: PersistentShoppingCart().showCartItems(
                    cartTileWidget: ({required data}) => Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                NetworkImageWidget(
                                  imageUrl: data.productThumbnail.toString(),
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.productName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        data.productDescription.toString(),
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
                                        children: [
                                          Text(
                                            r"$" + data.unitPrice.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              PersistentShoppingCart()
                                                  .removeFromCart(
                                                      data.productId);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 22,
                                              color:
                                                  Colors.red.withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        PersistentShoppingCart()
                                            .incrementCartItemQuantity(
                                                data.productId);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      data.quantity.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0XFF4E66FF)),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          PersistentShoppingCart()
                                              .decrementCartItemQuantity(
                                                  data.productId);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                    showEmptyCartMsgWidget: const Text('Cart is Empty')),
              ),
              PersistentShoppingCart().showTotalAmountWidget(
                  cartTotalAmountWidgetBuilder: (totalAmount) {
                return Column(
                  children: [
                    Visibility(
                      visible: totalAmount == 0.0 ? false : true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Total Amount :',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Text(
                            totalAmount.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFF4E66FF),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        //   final shoppingCart = PersistentShoppingCart();
                        //   Map<String, dynamic> cartData =
                        //       shoppingCart.getCartData();
                        //   List<PersistentShoppingCartItem> cartItems =
                        //       cartData['cartItem'];
                        //   double totalPrice = cartData['totalPrice'];
                        //   log('Total Price: $totalPrice');
                      },
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
