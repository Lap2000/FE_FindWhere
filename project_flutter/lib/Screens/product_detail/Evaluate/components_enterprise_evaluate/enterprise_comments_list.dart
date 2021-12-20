import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_flutter/Screens/data/productevaluate_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/product_detail/components/bottom.dart';
import 'package:project_flutter/Screens/product_detail/components/prod_title_price_stars.dart';


class CommentEnterprise extends StatelessWidget {

  final Products product;
  final String id;

  const CommentEnterprise({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  Widget build(BuildContext context) {

    List<dynamic> responseList = productEvaluate;

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
