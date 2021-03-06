import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_flutter/Screens/data/productevaluate_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/models/product_model.dart';
import 'package:project_flutter/Screens/product_detail/components/bottom.dart';
import 'package:project_flutter/Screens/product_detail/components/prod_title_price_stars.dart';


class CommentProduct extends StatelessWidget {

  final ProductModel product;
  final String id;

  const CommentProduct({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  Widget build(BuildContext context) {

    List<dynamic> responseList = productEvaluate;
    final titles = ['bike', 'boat', 'bus', 'car',
      'railway', 'run', 'subway', 'transit', 'walk'];

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

    return ListView.builder(
            itemCount: productEvaluate.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.green[100],
                  shadowColor: Colors.blueGrey,
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: Text(productEvaluate[index].comment),
                          backgroundColor: Colors.lightGreenAccent,
                          actions: [
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    leading: Text(productEvaluate[index].userID),
                    title: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                          size: 20,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          productEvaluate[index].eRank.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Container(
                            child: Text(
                              productEvaluate[index].comment,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.0,),
                            ),
                          ),
                        ),
                       //Text(productEvaluate[index].comment),
                      ],
                    ),
                  ),
                );
              },
          //const SizedBox(height: 10),
          //ProdAvaliableColors(colors: product.avaliableColors),
          //ProdDetBottom(price: product.price,id: id,),
    );
  }
}
