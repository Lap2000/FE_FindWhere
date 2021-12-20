import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/components/category.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';

import 'components/header.dart';
import 'components/home_list_view.dart';
import 'components/news.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              title: 'Popular',
              buttonTitle: 'Show All',
              onPress: () {},
            ),
            // HomeListView(
            //   items: dummyList.where((element) => element.rate >= 4.5).toList(),
            // ),
            // ! CHAIRS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Chairs', buttonTitle: 'See more', onPress: () { print('See more pressed');},),
            // HomeListView(
            //   items: dummyList
            //       .where((element) => element.type == ItemType.chair)
            //       .toList(),
            // ),
            // ! BEDS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Beds', buttonTitle: 'See more', onPress: () {},),
            // HomeListView(
            //   items: dummyList
            //       .where((element) => element.type == ItemType.bed)
            //       .toList(),
            // ),
            // ! TABLES
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Tables', buttonTitle: 'See more', onPress: () {},),
            // HomeListView(
            //   items: dummyList
            //       .where((element) => element.type == ItemType.table)
            //       .toList(),
            // ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
        //bottomNavigationBar: BottomNavigationBar(
            //),
        ),
    );
  }
}
