import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: _appBar(context, themeProvider),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context, ThemeProvider themeProvider) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.popAndPushNamed(context, '/homescreen'),
        icon: const Icon(
          FontAwesome.arrow_left_solid,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            "Raihan",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => setState(
            () {
              themeProvider.toggleTheme(context);
            },
          ),
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
      ],
    );
  }
}
