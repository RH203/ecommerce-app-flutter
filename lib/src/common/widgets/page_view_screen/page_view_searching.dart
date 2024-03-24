import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageViewSearching extends StatelessWidget {
  const PageViewSearching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Lottie.asset(
            "assets/image/on_boarding_images/searching-animation.json",
            animate: true,
            repeat: true,
            width: 450,
          ),
        ),
        Text(
          "For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
