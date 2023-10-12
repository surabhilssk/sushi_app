import 'package:flutter/widgets.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //salmon sushi
    Food(
        name: 'Salmon Sushi',
        price: "21.60",
        imagePath: 'images/sushi_3.png',
        rating: "4.9"),

    //tuna
    Food(
        name: 'Tuna',
        price: "23.00",
        imagePath: 'images/sushi_1.png',
        rating: "3.2"),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
