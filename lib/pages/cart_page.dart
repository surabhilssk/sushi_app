import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

import '../models/food.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Cart'),
          backgroundColor: primayColor,
          elevation: 0,
        ),
        body: Container(
          color: primayColor,
          child: ListView.builder(
            itemCount: value.cart.length,
            itemBuilder: (BuildContext context, int index) {
              //get food from cart
              final Food food = value.cart[index];
              //get food name\
              final String foodName = food.name;

              //get food price
              final String foodPrice = food.price;

              //return list tile
              return ListTile(
                title: Text(foodName),
                subtitle: Text(foodPrice),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: secondaryColor,
                  ),
                  onPressed: () => removeFromCart(food, context),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
