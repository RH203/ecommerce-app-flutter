import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/features/main_screen/controllers/products.dart';
import 'package:ecommerce_app/src/features/main_screen/models/user/user_provider.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/controllers/wishtlist_controllers.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.get('PROJECT_URL'),
    anonKey: dotenv.get('ANON_KEY_API'),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistController(),
        )
      ],
      child: const App(),
    ),
  );
}
