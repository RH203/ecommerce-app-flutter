import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../models/wishlist_item.dart';

class WishlistController extends ChangeNotifier {
  var log = Logger();
  Map<String, WishlistItem> _wishlist = {};

  // Getter untuk wishlist
  Map<String, WishlistItem> get wishlist => _wishlist;

  // Setter untuk menambahkan item ke wishlist
  void addToWishlist(WishlistItem item) {
    _wishlist[item.itemId] = item;
    log.d(_wishlist);
    notifyListeners();
  }

  int countItem() {
    return _wishlist.length;
  }

  // Setter untuk menghapus item dari wishlist
  void removeFromWishlist(
      String itemId, String title, String image, double price) {
    _wishlist.remove(itemId);
    _wishlist.remove(title);
    _wishlist.remove(image);
    _wishlist.remove(price);
    notifyListeners();
  }
}
