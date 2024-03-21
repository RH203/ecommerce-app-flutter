import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageViewDelivery extends StatelessWidget {
  const PageViewDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Lottie.asset(
            "assets/image/on_boarding_images/delivery-animation.json",
            animate: true,
            repeat: true,
            width: 450,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100),
          child: Text(
            "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
