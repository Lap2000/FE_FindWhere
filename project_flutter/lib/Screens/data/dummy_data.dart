import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_flutter/Config/config.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Screens/models/product_model.dart';

class APIsv {
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

  Future<dynamic> fetchEnterprise(String id_enterprise) async {
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    var config = host_uri();
    final url = Uri.parse(config + 'user/getEnterpriseById?id='+id_enterprise);
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
      return jsonDecode(response.body)['data'];
    }
    return null;
  }
}


//List<ProductModel> Product = await APIsv().fetchProduct();

List<Products> dummyList = [
  Products(
    Pid: '45hg546h657jn467j46',
    name: 'Bánh mì Huỳnh Mai',
    imageUrl: 'https://www.freeiconspng.com/thumbs/chair-png/chair-png-30.png',
    price: 10000,
    rate: 3.4,
    type: ["Thực phẩm", "Bánh mì"],
  ),
  Products(
    Pid: '45hg546h657jn467j46',
    name: 'Bánh mì Ba Béo',
    imageUrl: 'https://www.freeiconspng.com/thumbs/chair-png/chair-png-30.png',
    price: 10000,
    rate: 4,
    type: ["Thực phẩm", "Bánh mì"],
  ),
  Products(
    Pid: '45hg546h657jn467j46',
    name: 'Bánh mì PewPew',
    imageUrl: 'https://www.freeiconspng.com/thumbs/chair-png/chair-png-30.png',
    price: 50000,
    rate: 5,
    type: ["Thực phẩm", "Bánh mì"],
  ),
  Products(
    Pid: '45hg546h657jn467j46',
    name: 'Bánh mì Trương Sỏi',
    imageUrl: 'https://www.freeiconspng.com/thumbs/chair-png/chair-png-30.png',
    price: 10000,
    rate: 4.5,
    type: ["Thực phẩm", "Bánh mì"],
  ),
  // //! CHAIRS
  // Model(
  //   id: '45hg546h657jn467j46',
  //   name: 'Chair Num 1',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl: 'https://www.freeiconspng.com/thumbs/chair-png/chair-png-30.png',
  //   price: 210.99,
  //   rate: 3.4,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.chair,
  // ),
  // Model(
  //   id: '45hg546h657jn467j46',
  //   name: 'Chair Num fake',
  //   description:
  //   'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl: 'https://winchair.vn/wp-content/uploads/2020/04/Ghe-nhua-san-vuon-Leisure-chair-WC085-mau-xanh-la-1.jpg',
  //   price: 210.99,
  //   rate: 3.4,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.chair,
  // ),
  // Model(
  //   id: '34v345g4h537h667',
  //   name: 'Chair Num 2',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl: 'https://www.freeiconspng.com/uploads/vintage-chair-png-2.png',
  //   price: 110.99,
  //   rate: 4.4,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.chair,
  // ),
  // Model(
  //   id: '34hg4653nb76j78m7',
  //   name: 'Chair Num 3',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl: 'https://www.freeiconspng.com/uploads/vintage-chair-png-2.png',
  //   price: 199.99,
  //   rate: 5.0,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.chair,
  // ),
  // // ! BEDS
  // Model(
  //   id: 'g243g536hn768n78mn',
  //   name: 'Bed Num 1',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl:
  //       'https://pngpress.com/wp-content/uploads/2020/08/uploads_bed_bed_PNG17418.png',
  //   price: 499.99,
  //   rate: 3.0,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.bed,
  // ),
  // Model(
  //   id: 'g4523gb76678j875j7jk',
  //   name: 'Bed Num 2',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl:
  //       'https://freepngimg.com/thumb/aquarium/47403-3-sleigh-bed-png-download-free.png',
  //   price: 899.99,
  //   rate: 4.7,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.bed,
  // ),
  // Model(
  //   id: '45g543gg76b78j78k',
  //   name: 'Bed Num 3',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl:
  //       'https://www.transparentpng.com/thumb/bed/black-white-elegant-bed-png-hd--rgrF4o.png',
  //   price: 399.99,
  //   rate: 4.7,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.bed,
  // ),
  // // ! TABLES
  // Model(
  //   id: 'bv4w53b46n778m8k9,m',
  //   name: 'Table Num 1',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl:
  //       'https://www.nicepng.com/png/full/172-1722828_table-png-table-in-png.png',
  //   price: 215.99,
  //   rate: 2.0,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.table,
  // ),
  // Model(
  //   id: 'g452b53b76n87mn89k',
  //   name: 'Table Num 2',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl: 'https://freepngimg.com/save/1352-table-png-image/500x500',
  //   price: 315.99,
  //   rate: 3.9,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.table,
  // ),
  // Model(
  //   id: 'bv45wb5b674n875mn7',
  //   name: 'Table Num 3',
  //   description:
  //       'This is description for this item. This is description for this item. This is description for this item.',
  //   imageUrl:
  //       'https://freepngdownload.com/image/thumb/table-png-free-download-4.png',
  //   price: 350.20,
  //   rate: 4.9,
  //   avaliableColors: [
  //     Colors.red,
  //     Colors.purple,
  //     Colors.green,
  //     Colors.yellow,
  //     Colors.pink,
  //   ],
  //   type: ItemType.table
  // ),
];
