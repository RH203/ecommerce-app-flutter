import 'package:ecommerce_app/src/features/home_screen/views/home_screen.dart';
import 'package:ecommerce_app/src/features/main_screen/views/main_screen.dart';
import 'package:ecommerce_app/src/routes/custom_router.dart';
import 'package:ecommerce_app/src/utils/shared/shared_prefe.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var log = Logger();
  bool? _accessToken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPref sharedPref = SharedPref();
    sharedPref.getAccessToken().then((value) {
      setState(() {
        _accessToken = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      theme: Provider.of<ThemeProvider>(context).themeData,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) =>
          CustomRouter.pageRoute(settings.name ?? '/', settings),
      home: _buildInitialScreen(),
    );
  }

  Widget _buildInitialScreen() {
    if (_accessToken == true) {
      return const MainScreen();
    } else {
      return const HomeScreen();
    }
  }
}
