import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.text, super.key, required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 155, 60, 53),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(
              width: 10,
            ),

            //icon
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
