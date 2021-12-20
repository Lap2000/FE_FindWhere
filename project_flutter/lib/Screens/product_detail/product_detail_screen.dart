import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/models/product_model.dart';

import 'components/details.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  final List<ProductModel> _listProduct;

  const ProductDetailScreen({
    Key? key,
    required this.id, required List<ProductModel> listProduct}) :_listProduct = listProduct,super(key: key);
//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }
//
// class _ProductDetailScreenState extends State<ProductDetailScreen> {

  // List<ProductModel> _listProduct = [];
  //
  // void Init() async {
  //   List<ProductModel> Products = await APIsv().fetchProduct();
  //   setState(() {
  //     _listProduct = Products;
  //   });
  //
  //   //print(list); // will print [1, 2, 3, 4] on console.
  // }
  //
  // void initState() {
  //   Init();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    //List<ProductModel> Products = await APIsv().fetchProduct();
    final ProductModel product = _listProduct.firstWhere((element) => element.id == id);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color.fromARGB(253, 8, 252, 252),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: Navigator.of(context).pop,
          ),
          title: const Text(
            'Product Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(10, 43, 53, 0.9),
              Color.fromRGBO(10, 43, 53, 0.6),
              Color.fromRGBO(10, 43, 53, 0.3),
            ],
          )),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(25),
                  child: Image.network(
                    product.imagesProduct[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: AboutProduct(
                  product: product,
                  id: id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
