import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CartButtons extends StatelessWidget {
  const CartButtons({required this.onPressed, required this.icon, super.key});

  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
