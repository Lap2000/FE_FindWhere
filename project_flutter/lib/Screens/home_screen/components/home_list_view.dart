import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/models/product_model.dart';
import 'package:project_flutter/Screens/product_detail/product_detail_screen.dart';

class HomeListView extends StatelessWidget {
  final List<ProductModel> items;

  const HomeListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 320,
        width: double.infinity,
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ProductDetailScreen(id: items[i].id, listProduct: items),
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 10),
                    height: 300,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 55,
                    top: 25,
                    child: Container(
                      height: 130,
                      width: 180,
                      // Add the line below
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.green, width: 2.0)),
                      child: Image.network(
                        items[i].imagesProduct[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 95,
                  //   top: 20,
                  //   child: SizedBox(
                  //     height: 120,
                  //     width: 120,
                  //     child: Image.network(
                  //       items[i].imagesProduct[0],
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: 160,
                    left: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 1),
                              Text(
                                  items[i].star.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 1),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          items[i].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${items[i].price.toString()}  \  VND ',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 170,
                          child: Text(
                            items[i].description,
                            //items[i].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
