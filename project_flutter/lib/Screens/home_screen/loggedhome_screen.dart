import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Config/config.dart';
import 'package:project_flutter/Screens/components/category.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Screens/models/product_model.dart';

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
  late Future<Products> futureProducts;
  // late List<Products> productList = [] ;
  // late List pr = [];
  List<ProductModel> _listProduct = [];

  void Init() async {
    Future<List<ProductModel>> _futureOfList = fetchProduct();
    List<ProductModel> Products = await _futureOfList;
    setState(() {
      _listProduct = Products;
    });

    //print(list); // will print [1, 2, 3, 4] on console.
  }

  //Khởi tạo
  @override
  void initState() {
    Init();
    //Get_ListProduct();
    super.initState();
    //_listProduct = fetchProduct();
    //print(futureProducts.toString());
  }

  Future<List<ProductModel>> fetchProduct() async {
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    var config = host_uri();
    final url = Uri.parse(config + 'product/getALLProduct');
    var response = await http.get(
        url,
        headers: {
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          //HttpHeaders.contentTypeHeader: 'application/json',
          //HttpHeaders.authorizationHeader: token.toString(),
        }
    );
    //var res = response.body;
    //print(jsonDecode(response.body)['data']);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
      if (jsonResponse.isEmpty) {
        return [];
      }
      return jsonResponse.map((item) => ProductModel.fromMap(item)).toList();
    }
    return [];
  }



  //Fetch get List Products
  // void Get_ListProduct() async {
  //   var config = host_uri();
  //   final url = Uri.parse(config+'product/getALLProduct');
  //   //SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //final String token = prefs.getString('apiToken').toString();
  //   //print(prefs.getString('apiToken'));
  //   var response = await http.get(
  //       url,
  //       headers:{
  //         "Content-type": "application/x-www-form-urlencoded",
  //         "Accept": "application/json",
  //         //HttpHeaders.contentTypeHeader: 'application/json',
  //         //HttpHeaders.authorizationHeader: token.toString(),
  //       }
  //   );
  //   var res = response.body;
  //   if (response.statusCode == 200) {
  //     //productList = Products.fromJson(jsonDecode(res)) as List<Products>;
  //     //print(jsonDecode(res)['data']);
  //     // setState(() {
  //     //   productList = res;
  //     // });
  //     // List<dynamic> body = jsonDecode(res)['data'];
  //     // // setState(() {
  //     // //   productList = body.map((dynamic item) => Products.fromJson(item)).toList();
  //     // // });
  //     // productList = jsonDecode(body.toString());
  //     // //productList = body.map((dynamic item) => Products.fromJson(item)).toList();
  //     // print(productList);
  //     // //print(jsonDecode(res)['data'].runtimeType);
  //   } else {
  //     print(response.statusCode);
  //   }
  //   //print();
  //   //print('Token : ${token}');
  // }




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
              items: _listProduct,
            ),
            // ! CHAIRS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Đồ ăn', buttonTitle: 'See more', onPress: () { print('See more pressed');},),
            HomeListView(
              items:_listProduct,
              // items: dummyList
              //     .where((element) => element.type == ItemType.chair)
              //     .toList(),
            ),
            // ! BEDS
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Nước uống', buttonTitle: 'See more', onPress: () {},),
            HomeListView(
              items:_listProduct,
              // items: dummyList
              //     .where((element) => element.type == ItemType.bed)
              //     .toList(),
            ),
            // ! TABLES
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            Category(title: 'Trung tâm học Ngôn Ngữ', buttonTitle: 'See more', onPress: () {},),
            HomeListView(
              items:_listProduct,
              // items: dummyList
              //     .where((element) => element.type == ItemType.table)
              //     .toList(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
          ),
    );
  }
}
