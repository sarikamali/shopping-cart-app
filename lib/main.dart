import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/view/product_screen.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async {
  await PersistentShoppingCart().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
