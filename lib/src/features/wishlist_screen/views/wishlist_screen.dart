// ignore_for_file: unused_field, prefer_final_fields

import 'package:ecommerce_app/src/features/wishlist_screen/controllers/wishtlist_controllers.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/models/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  var log = Logger();
  late List<WishlistItem> _wishlistItems;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      final wishlistController = context.read<WishlistController>();
      _wishlistItems = wishlistController.wishlist.values.toList();
      log.d(_wishlistItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _wishlistItems.length,
        itemBuilder: (context, index) {
          final wishlistItem = _wishlistItems[index];
          log.d("LISTVIEW [WISHLIST]: ${wishlistItem.title}");
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/lottie/loading-image-1.gif',
                    image: wishlistItem.image,
                    width: 100,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      wishlistItem.title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      wishlistItem.price.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      context.read<WishlistController>().removeFromWishlist(
                            index.toString(),
                            wishlistItem.image,
                            wishlistItem.title,
                            wishlistItem.price,
                          );
                    });
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    size: 30,
                    color: Colors.red[500],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
