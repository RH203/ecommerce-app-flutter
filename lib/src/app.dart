import 'package:ecommerce_app/src/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff673AB7),
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          labelMedium: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const Home(),
    );
  }
}
