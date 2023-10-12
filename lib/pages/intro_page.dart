import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/buttons.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 26, 18),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //shop name
              Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //shop logo
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('images/sushi.png'),
              ),

              const SizedBox(
                height: 25,
              ),

              //shop title
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              //shop subtitle
              Text(
                'Feel the taste of the most popular Japanese food from anywhere and anytime',
                style: TextStyle(
                  color: Colors.grey[200],
                  height: 2,
                ),
              ),

              const SizedBox(height: 25),

              //get started button

              MyButton(
                text: 'Getting Started',
                onTap: () {
                  //go to menu page
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
