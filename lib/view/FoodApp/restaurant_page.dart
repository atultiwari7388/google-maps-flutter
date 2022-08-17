import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/view/FoodApp/components/menu_card.dart';
import 'package:flutter_bootcamp/view/FoodApp/components/restaruant_categories.dart';
import 'package:flutter_bootcamp/view/FoodApp/components/restaurant_info.dart';
import 'package:flutter_bootcamp/view/FoodApp/models/menu.dart';

import 'components/restaurant_app_bar.component.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  final scrollController = ScrollController();

  double restaurantInfoHeight = 200 + 170 - kToolbarHeight;

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (kDebugMode) {
        print(scrollController.offset);
      }
    });
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }

      scrollController.animateTo(
        //116= 100 menu item height + 16 bottom padding of each item
        // 50 = 18 title font size + 32 (16 vertical padding on title)
        restaurantInfoHeight + (116 * totalItems) + (50 * index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //appBar
          const RestaurantAppBar(),
          const SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: RestaurantCategories(
              selectedIndex: selectedCategoryIndex,
              valueChanged: scrollToCategory,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, categoryIndex) {
                  List<Menu> items = demoCategoryMenus[categoryIndex].items;
                  return MenuCategoryItem(
                    title: demoCategoryMenus[categoryIndex].category,
                    items: List.generate(
                      items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: MenuCard(
                          image: items[index].image,
                          title: items[index].title,
                          price: items[index].price,
                        ),
                      ),
                    ),
                  );
                },
                childCount: demoCategoryMenus.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
