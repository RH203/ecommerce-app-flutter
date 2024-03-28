import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/mainscreen'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
      ),
    );
  }
}
