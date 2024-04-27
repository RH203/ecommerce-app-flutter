import 'package:ecommerce_app/src/features/auth_screen/views/signin_screen.dart';
import 'package:ecommerce_app/src/features/auth_screen/views/signup_screen.dart';
import 'package:ecommerce_app/src/features/cart_screen/views/cart_screen.dart';
import 'package:ecommerce_app/src/features/home_screen/views/home_screen.dart';
import 'package:ecommerce_app/src/features/main_screen/views/main_screen.dart';
import 'package:ecommerce_app/src/features/profile_screen/views/profile_screen.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/views/wishlist_screen.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      theme: Provider.of<ThemeProvider>(context).themeData,
      themeMode: ThemeMode.system,
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signinscreen': (context) => const SignInScreen(),
        '/signupscreen': (context) => const SignUpScreen(),
        '/mainscreen': (context) => const MainScreen(),
        '/cartscreen': (context) => const CartScreen(),
        '/wishlistscreen': (context) => const WishlistScreen(),
        '/profilescreen': (context) => const ProfileScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
