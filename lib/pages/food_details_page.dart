import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/buttons.dart';
import 'package:sushi_app/components/cart_buttons.dart';
import 'package:sushi_app/theme/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({required this.food, super.key});

  final Food food;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addtoCart() {
    //add to cart only if count is greater than zero
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.food, quantityCount);
      //let user know the process is successfull
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: primayColor,
                content: const Text(
                  'Item added to cart!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      //to exit dialogue
                      Navigator.pop(context);
                      //to exit page
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //listview of food details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  children: [
                    //image
                    Image.asset(
                      widget.food.imagePath,
                      height: 250,
                    ),

                    //rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.food.rating,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //food name
                    Text(
                      widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 32,
                      ),
                    ),

                    const SizedBox(height: 25),

                    //description
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 10),
                    //description details
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                      style: TextStyle(
                        fontSize: 16.5,
                        height: 1.7,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //price+quantity+add to cart button
            Container(
              // margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: primayColor,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(20),
                //     topRight: Radius.circular(20)),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + widget.food.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          //minus button
                          CartButtons(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),

                          //quantity
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          //add button
                          CartButtons(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //add to cart icon
                  MyButton(text: 'Add To Cart', onTap: addtoCart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
