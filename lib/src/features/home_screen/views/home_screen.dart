import 'package:ecommerce_app/src/common/widgets/button/custom_button.dart';
import 'package:ecommerce_app/src/common/widgets/page_view_screen/page_view_deliver.dart';
import 'package:ecommerce_app/src/common/widgets/page_view_screen/page_view_searching.dart';
import 'package:ecommerce_app/src/common/widgets/page_view_screen/page_view_shopping.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  void _changePage() {
    if (_currentPage < 2) {
      _controller.animateToPage(
        _currentPage + 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: const [
                      PageViewShopping(),
                      PageViewDelivery(),
                      PageViewSearching(),
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 0.4),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SlideEffect(
                        activeDotColor:
                            Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _currentPage == 2
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () =>
                              Navigator.pushNamed(context, '/signinscreen'),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20,
                          borderRadiusGeometry: BorderRadius.circular(15),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          text: "Sign in",
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "or",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                          ),
                        ),
                        CustomButton(
                          onTap: () =>
                              Navigator.pushNamed(context, '/signupscreen'),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20,
                          borderRadiusGeometry: BorderRadius.circular(15),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          text: "Sign up",
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(left: 280, right: 10),
                    width: MediaQuery.sizeOf(context).width,
                    child: IconButton(
                      onPressed: _changePage,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.secondary,
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      icon: const Icon(
                        FontAwesome.arrow_right_solid,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
