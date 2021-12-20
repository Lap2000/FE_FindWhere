import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/models/product_model.dart';
import 'package:project_flutter/Screens/product_detail/components/prod_title_price_stars.dart';

import 'avaliable_colors.dart';
import 'bottom.dart';

class AboutProduct extends StatelessWidget {
  final ProductModel product;
  final String id;

  const AboutProduct({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          ProdTitleStars(
            title: product.name,
            rate: product.star!,
            price: product.price!,
            types: product.Types,
            id_enterprise: product.E_id,
          ),
          //const SizedBox(height: 10),
          //ProdAvaliableColors(colors: product.avaliableColors),
          //const SizedBox(height: 10),
         // Text(
            //product.description,
            //style: const TextStyle(color: Colors.grey),
          //),
          const Spacer(),
          ProdDetBottom(price: product.price!,id: id, Product: product,),
        ],
      ),
    );
  }
}
