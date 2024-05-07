// ignore_for_file: avoid_print, prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:ecommerce_app/src/features/cart_screen/views/cart_screen.dart';
import 'package:ecommerce_app/src/features/main_screen/controllers/products.dart';
import 'package:ecommerce_app/src/features/main_screen/models/models_category_button.dart';
import 'package:ecommerce_app/src/features/profile_screen/views/profile_screen.dart';
import 'package:ecommerce_app/src/features/wishlist_screen/views/wishlist_screen.dart';
import 'package:ecommerce_app/src/utils/provider/user_provider.dart';
import 'package:ecommerce_app/src/utils/services/api/products_api.dart';
import 'package:ecommerce_app/src/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
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
  var log = Logger();

  int _activeIndex = 0;
  int _currentPageIndex = 0;

  bool _isLoading = false;

  List<Widget> pages = [];

  List<String> _category = [
    "Category",
    "Nike",
    "Adidas",
    "Under Armour",
  ];

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

    _isLoading = true;

    products.getAllProduct().then((_) {
      _modelsCategoryButton = productsApi.modelsCategoryButton;
      setState(() {
        _isLoading = false;
      });
    }).catchError((error) {
      _isLoading = false;

      log.e("Error during initialization: $error");
    });
  }

  //* Main function
  @override
  Widget build(BuildContext context) {
    pages = [
      _bodyMainScreen(context),
      const WishlistScreen(),
      const ProfileScreen(),
      const CartScreen(),
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
                    child: LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 80,
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
                                onTap: () => setState(() {
                                  products.resetProducts();
                                  index == 0
                                      ? products.getAllProduct()
                                      : products.getAllProductByBrand(
                                          _category.elementAt(index));
                                }),
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
                                            .secondary,
                                      ),
                                      child: context
                                              .watch<ThemeProvider>()
                                              .isDarkMode
                                          ? _modelsCategoryButton
                                              ?.iconProductLightMode[index]
                                          : _modelsCategoryButton
                                              ?.iconProductDarkMode[index],
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
                            childAspectRatio: 0.69,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: products.products?.length ?? 0,
                          itemBuilder: (context, index) {
                            // log.i(products.products?.length ?? 0);
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                color: Theme.of(context).colorScheme.tertiary,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/icons/lottie/loading-image-1.gif',
                                          image: products.products != null &&
                                                  products.products!.isNotEmpty
                                              ? products.products![index].image
                                              : '',
                                          fit: BoxFit.cover,
                                          width: 200,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 6,
                                            top: 5,
                                          ),
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
                                                      .onTertiary,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 6, bottom: 8, right: 6),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '\$ ${products.products![index].price.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onTertiary,
                                                ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 3,
                                                horizontal: 9,
                                              ),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer,
                                            ),
                                            icon: const Icon(
                                              EvaIcons.plus,
                                            ),
                                          )
                                        ],
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
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
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
                    ? const Icon(Iconsax.home_1_outline)
                    : const Icon(Iconsax.home_1_bold),
              ),
              BottomNavigationBarItem(
                label: "Wishlist",
                icon: _currentPageIndex != 1
                    ? Badge.count(
                        count: 3,
                        child: const Icon(Icons.favorite_outline),
                      )
                    : Badge.count(
                        count: 3,
                        child: const Icon(Icons.favorite),
                      ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: _currentPageIndex != 2
                    ? const Icon(EvaIcons.person_outline)
                    : const Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: "Cart",
                icon: _currentPageIndex != 3
                    ? Badge.count(
                        count: 0,
                        child: const Icon(Iconsax.bag_outline),
                      )
                    : Badge.count(
                        count: 0,
                        child: const Icon(Iconsax.bag_bold),
                      ),
              )
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
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/image/carousel/shoes-carousel.png",
                    fit: BoxFit.fill,
                  ),
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
          setState(() {
            _activeIndex = index;
          });
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context, ThemeProvider themeProvider) {
    log.i(
        " AppBAR: ${context.watch<UserProvider>().firstName} ${context.watch<UserProvider>().lastName}");
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
            "${Provider.of<UserProvider>(context).firstName} ${Provider.of<UserProvider>(context).lastName}",
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
      ],
    );
  }
}
