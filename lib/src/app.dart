import 'package:ecommerce_app/src/features/home_screen/views/home_screen.dart';
import 'package:ecommerce_app/src/utils/theme/text_theme_custom.dart';
import 'package:ecommerce_app/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: ThemeData().textTheme.merge(
              TextThemeCustom.appTextTheme(context),
            ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: ThemeData().textTheme.merge(
              TextThemeCustom.appTextTheme(context),
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
