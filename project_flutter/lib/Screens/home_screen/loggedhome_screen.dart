import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/components/category.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';

import 'components/header.dart';
import 'components/home_list_view.dart';
import 'components/news.dart';
import 'components/search_bar.dart';

class LoggedHomeScreen extends StatefulWidget {
  const LoggedHomeScreen({Key? key}) : super(key: key);

  @override
  State<LoggedHomeScreen> createState() => _LoggedHomeScreenState();
}

class _LoggedHomeScreenState extends State<LoggedHomeScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(80,0, 255, 255),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SearchBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            HomeNews(),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            // ! POPULAR
            Category(
              title: 'Phổ biến ở gần bạn',
              buttonTitle: 'Show All',
              onPress: () {},
            ),
            HomeListView(
              items: dummyList.where((element) => element.rate >= 4.5).toList(),
            ),
            // ! CHAIRS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Đồ ăn', buttonTitle: 'See more', onPress: () { print('See more pressed');},),
            HomeListView(
              items: dummyList
                  .where((element) => element.type == ItemType.chair)
                  .toList(),
            ),
            // ! BEDS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Nước uống', buttonTitle: 'See more', onPress: () {},),
            HomeListView(
              items: dummyList
                  .where((element) => element.type == ItemType.bed)
                  .toList(),
            ),
            // ! TABLES
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Trung tâm học Ngôn Ngữ', buttonTitle: 'See more', onPress: () {},),
            HomeListView(
              items: dummyList
                  .where((element) => element.type == ItemType.table)
                  .toList(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
