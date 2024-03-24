import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(context),
      child: const App(),
    ),
  );
}
