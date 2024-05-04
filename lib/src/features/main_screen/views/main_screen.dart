// ignore_for_file: avoid_print, prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:ecommerce_app/src/features/main_screen/controllers/products.dart';
import 'package:ecommerce_app/src/features/main_screen/models/models_category_button.dart';
import 'package:ecommerce_app/src/features/profile_screen/views/profile_screen.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/views/wishlist_screen.dart';
import 'package:ecommerce_app/src/utils/services/api/products_api.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:string_extensions/string_extensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _searchController = TextEditingController();
  Products products = Products();
  ProductsApi productsApi = ProductsApi();
  ModelsCategoryButton? _modelsCategoryButton;

  int _activeIndex = 0;
  int _currentPageIndex = 0;

  bool _isLoading = false;

  List<Widget> pages = [];

  void _onTapSearch() {
    String searchValue = _searchController.text;
    print(searchValue);
  }

  void _onTapBottomNavigationBar(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    products.getAllProduct().then((_) {
      setState(() {
        _isLoading = false;
        _modelsCategoryButton = productsApi.modelsCategoryButton;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      print("Error during initialization: $error");
    });
  }

  //* Main function
  @override
  Widget build(BuildContext context) {
    pages = [
      _bodyMainScreen(context),
      const WishlistScreen(),
      const ProfileScreen(),
    ];
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: _appBar(context, themeProvider),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: pages.elementAt(_currentPageIndex),
          ),
          bottomNavigationBar: _bottomNavigationBarCustom(context),
          floatingActionButton: _floatingActionButtonCustom(context),
        );
      },
    );
  }

  SingleChildScrollView _bodyMainScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //* Search bar
          _searchBarCustom(),
          //* Carousel image
          _carouselSlider(),
          _animatedSmoothIndicator(context),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: _isLoading
                ? Center(
                    child: LoadingAnimationWidget.stretchedDots(
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 50,
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              _modelsCategoryButton?.categoryProduct.length ??
                                  0,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                // TODO: ontap button category
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          50,
                                        ),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                      ),
                                      child: _modelsCategoryButton
                                          ?.iconProduct[index],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        _modelsCategoryButton
                                                ?.categoryProduct[index]
                                                .capitalize ??
                                            "Something wrong: try to refresh application",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                                fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: products.products?.length ?? 0,
                          itemBuilder: (context, index) {
                            print(products.products?.length ?? 0);
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/icons/lottie/loading-image.gif',
                                          image: products.products != null &&
                                                  products.products!.isNotEmpty
                                              ? products.products![index].image
                                              : '',
                                          fit: BoxFit.cover,
                                          width: 200,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 6, top: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            products.products != null &&
                                                    products
                                                        .products!.isNotEmpty
                                                ? (products.products![index]
                                                            .title.countWords >
                                                        5
                                                    ? "${products.products![index].title.split(" ").take(5).join(" ")}..."
                                                    : products
                                                        .products![index].title)
                                                : '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 6),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        products.products![index].price
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  Container _bottomNavigationBarCustom(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            selectedItemColor: Theme.of(context).colorScheme.onBackground,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "Home",
                icon: _currentPageIndex != 0
                    ? const Icon(Icons.home_outlined)
                    : const Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                label: "Wishlist",
                icon: _currentPageIndex != 1
                    ? const Icon(Icons.favorite_outline)
                    : const Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: _currentPageIndex != 2
                    ? const Icon(Icons.person_outline)
                    : const Icon(Icons.person),
              ),
            ],
            currentIndex: _currentPageIndex,
            onTap: _onTapBottomNavigationBar,
            enableFeedback: false,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _floatingActionButtonCustom(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () {},
      child: GestureDetector(
        onTap: () {},
        child: Badge(
          smallSize: 10,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.message,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 30,
          ),
        ),
      ),
    );
  }

  TextFieldCustom _searchBarCustom() {
    return TextFieldCustom.search(
      controller: _searchController,
      hintText: "Search",
      searchFunction: _onTapSearch,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your items";
        }
        if (Validator.searchIsValid(value)) {
          return "Invalid items";
        }
        return "NULL";
      },
    );
  }

  AnimatedSmoothIndicator _animatedSmoothIndicator(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: _activeIndex,
      count: 5,
      effect: WormEffect(
        activeDotColor: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  CarouselSlider _carouselSlider() {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Image.asset(
                  "assets/image/carousel/shoes-carousel.png",
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        initialPage: 0,
        height: 180,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          _activeIndex = index;
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context, ThemeProvider themeProvider) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.popAndPushNamed(context, '/'),
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
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => themeProvider.toggleTheme(context),
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 7),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/cartscreen'),
            child: Badge.count(
              largeSize: 15,
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onPrimary,
              count: 2,
              child: const Icon(
                Icons.add_shopping_cart,
              ),
            ),
          ),
        )
      ],
    );
  }
}
