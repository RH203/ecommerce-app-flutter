import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageViewShopping extends StatelessWidget {
  const PageViewShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Lottie.asset(
            "assets/image/on_boarding_images/shopping-animation.json",
            animate: true,
            repeat: true,
            width: 450,
          ),
        ),
        Text(
          "Welcome to a World of Limitless Choices - Your Perfect Product Awaits!",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
