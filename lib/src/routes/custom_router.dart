import 'package:ecommerce_app/src/features/auth_screen/views/signin_screen.dart';
import 'package:ecommerce_app/src/features/auth_screen/views/signup_screen.dart';
import 'package:ecommerce_app/src/features/cart_screen/views/cart_screen.dart';
import 'package:ecommerce_app/src/features/home_screen/views/home_screen.dart';
import 'package:ecommerce_app/src/features/main_screen/views/main_screen.dart';
import 'package:ecommerce_app/src/features/profile_screen/views/profile_screen.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:page_route_animator/page_route_animator.dart';

class CustomRouter {
  static final Logger log = Logger("Route");

  static pageRoute(String name, RouteSettings settings) {
    switch (name) {
      case "/":
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.leftToRightWithFade,
          settings: settings,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const HomeScreen(),
        );
      case '/signinscreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.bottomToTopWithFade,
          settings: settings,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const SignInScreen(),
        );
      case '/signupscreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.sizeFromBottom,
          settings: settings,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const SignUpScreen(),
        );
      case '/mainscreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.leftToRightWithFade,
          settings: settings,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const MainScreen(),
        );
      case '/cartscreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.bottomLeftToTopRightWithFade,
          settings: settings,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const CartScreen(),
        );
      case '/wishlistscreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.rightToLeftWithFade,
          settings: settings,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const WishlistScreen(),
        );
      case '/profilescreen':
        return PageRouteAnimator(
          routeAnimation: RouteAnimation.topRightToBottomLeftWithFade,
          settings: settings,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 800),
          reverseDuration: const Duration(milliseconds: 800),
          child: const ProfileScreen(),
        );
      default:
        log.warning("Path not found");
        break;
    }
  }
}
