import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    int _activeIndex = 0;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: _appBar(context, themeProvider),
          body: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                //* Search bar
                TextFieldCustom(
                  controller: _searchController,
                  hintText: "Search",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your items";
                    }
                    if (Validator.searchIsValid(value)) {
                      return "Invalid items";
                    }
                    return "NULL";
                  },
                ),
                //* Carousel image
                CarouselSlider(
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          child: Center(
                            child: Text(
                              'text $i',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    height: 200,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _activeIndex = index;
                        },
                      );
                    },
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: 5,
                  effect: ScrollingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.onBackground,
                  ),
                )
              ],
            ),
          ),
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
