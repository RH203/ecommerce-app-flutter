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
  int _expiresAt = DateTime.now().millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    SharedPref sharedPref = SharedPref();
    sharedPref.getAccessToken().then((value) {
      _expiresAt = value;
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
    log.d("_expiresAt: $_expiresAt");
    log.d(DateTime.now().millisecondsSinceEpoch);

    if (_expiresAt < DateTime.now().millisecondsSinceEpoch) {
      return const HomeScreen();
    } else {
      return const MainScreen();
    }
  }
}
