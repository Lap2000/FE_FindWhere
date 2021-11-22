import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/data/productevaluate_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/product_detail/Evaluate/components/chart_star_evaluate.dart';
import 'package:project_flutter/Screens/product_detail/components/details.dart';
import 'package:project_flutter/utilities/constant.dart';

import 'components/chart_animation.dart';
import 'components/product_comments_list.dart';


class ProductEvaluateScreen extends StatefulWidget {
  const ProductEvaluateScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ProductEvaluateScreenState createState() => _ProductEvaluateScreenState();
}

class _ProductEvaluateScreenState extends State<ProductEvaluateScreen> {

  final List<StarLine> listEarnings = [
    StarLine(rate: "1", amount: 0, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    StarLine(rate: "2", amount: 1, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    StarLine(rate: "3", amount: 5, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    StarLine(rate: "4", amount: 45, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    StarLine(rate: "5", amount: 20, barColor: charts.ColorUtil.fromDartColor(Colors.green),),
  ];

  Color _ic1Color = Colors.white;
  Icon ic = new Icon(Icons.person, color: Colors.red,);

  @override
  Widget build(BuildContext context) {
    final Model product = dummyList.firstWhere((element) => element.id == widget.id);
    //final Model evaluate_product = productEvaluate as Model;

    Icon ic1 = Icon(Icons.star_border);
    Icon ic2 = Icon(Icons.star_border);
    Icon ic3 = Icon(Icons.star_border);
    Icon ic4 = Icon(Icons.star_border);
    Icon ic5 = Icon(Icons.star_border);

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
            'Product Evaluation',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 7.0),
                            prefixIcon: Icon(
                              Icons.insert_comment_outlined,
                              color: Colors.black,
                            ),
                            hintText: "Enter your comment",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            RatingBar.builder(
                            initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        )
                      ]
                    ),
                    backgroundColor: Colors.greenAccent,
                    actions: [
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Confirm',
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
              icon: Icon(Icons.comment),
            ),
          ],
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
              //Expanded(
                //child: ChartStar(
                  //listEarnings: listEarnings,
                  //productName: product.name,
                //),
              //),
              Expanded(
                child: ChartStar(productName: product.name, listEarnings: listEarnings, SumEvaluate: 71,),
              ),
              Expanded(
                child: CommentProduct(product: product, id: widget.id,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
