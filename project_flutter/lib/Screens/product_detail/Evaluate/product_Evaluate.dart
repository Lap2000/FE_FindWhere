import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_flutter/Config/config.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/data/productevaluate_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:project_flutter/Screens/models/product_model.dart';
import 'package:project_flutter/Screens/product_detail/Evaluate/components/chart_star_evaluate.dart';
import 'package:project_flutter/Screens/product_detail/components/details.dart';
import 'package:project_flutter/utilities/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'components/chart_animation.dart';
import 'components/product_comments_list.dart';


class ProductEvaluateScreen extends StatefulWidget {
  const ProductEvaluateScreen({Key? key, required this.id, required ProductModel Product}) :_Product = Product,super(key: key);

  final String id;
  final ProductModel _Product;

  @override
  _ProductEvaluateScreenState createState() => _ProductEvaluateScreenState();
}

class _ProductEvaluateScreenState extends State<ProductEvaluateScreen> {
  //colorChart:, barColor: charts.ColorUtil.fromDartColor(Colors.green),

  final List<StarLine> listEarnings = [
    StarLine(rate: "1", amount: 0),
    StarLine(rate: "2", amount: 1),
    StarLine(rate: "3", amount: 5),
    StarLine(rate: "4", amount: 45),
    StarLine(rate: "5", amount: 20),
  ];

  final List<StarLine> list_1 = [
  ];



  Color _ic1Color = Colors.white;
  Icon ic = new Icon(Icons.person, color: Colors.red,);

  //Biến dùng state
  late bool isEvaluated = true;
  late int num_evaluate = 0;
  late double star_evaluate = 0;
  late String evaluate_get = '';
  final controller_Comment = TextEditingController();


  //Khởi tạo
  @override
  void initState() {
    GetUsers_Evaluate();
    setState(() {
      num_evaluate = listEarnings.length;
    });
    super.initState();
  }



  //Fetch http request get user's evaluate
  void GetUsers_Evaluate() async {
    var config = host_uri();
    final url = Uri.parse(config+'evaluate/getUserEvaluate?pID='+widget.id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('apiToken').toString();
    var response = await http.get(
        url,
        headers: {
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          "Authorization": 'Basic $token',
        }
    );
    var res = response.body;
    if (response.statusCode == 200) {
      //print(jsonDecode(res)['data']);
      setState(() {
        isEvaluated = true;
        evaluate_get = jsonDecode(res)['data']['comment'];
        star_evaluate = jsonDecode(res)['data']['score'].toDouble();
        print(evaluate_get);
        // userName = jsonDecode(res)['data']['userName'];
        // name = jsonDecode(res)['data']['name'];
        // email = jsonDecode(res)['data']['email'];
        // phone = jsonDecode(res)['data']['phone'];
        // dateofBirth =
        // DateTime.tryParse(jsonDecode(res)['data']['dateofBirth'])!;
        // gender = jsonDecode(res)['data']['gender'];
      });
    } else {
      setState(() {
        isEvaluated = false;
        evaluate_get = "Bạn chưa đánh giá ! Hãy đánh giá !";
      });
      // if(isEvaluated)
      // {
      //   print(isEvaluated);
      // }
      // else print(isEvaluated);
    }
    print(res);
    print(response.statusCode);
  }

  //Fetch http request post user's evaluate
  void AddUsers_Evaluate() async {
    var config = host_uri();
    print(star_evaluate.runtimeType);
    print(controller_Comment.text.runtimeType);
    print(widget.id.runtimeType);
    final url = Uri.parse(config+'evaluate/addEvaluate');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('apiToken').toString();
    var response = await http.post(
        url,
        headers: {
          //"Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          "Authorization": 'Basic $token',
        },
        body:{
          "pID": widget.id,
          "score": star_evaluate.toString(),
          "comment": controller_Comment.text
        }
    );
    var res = response.body;
    print(res);
    if (response.statusCode == 200) {
      print(jsonDecode(res)['data']);
    } else {
      print(response.statusCode);
    }
  }





  @override
  Widget build(BuildContext context) {
    //final Products product = dummyList.firstWhere((element) => element.Pid == widget.id);
    //final Model evaluate_product = productEvaluate as Model;
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
                          controller: controller_Comment,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 7.0),
                            prefixIcon: Icon(
                              Icons.insert_comment_outlined,
                              color: Colors.black,
                            ),
                            hintText: evaluate_get,
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            RatingBar.builder(
                            initialRating: star_evaluate,
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
                                setState(() {
                                  star_evaluate = rating;
                                });
                                print(star_evaluate);
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
                          if(isEvaluated)
                          {
                            print('if');
                          }
                          else {
                            print('else');
                            AddUsers_Evaluate();
                          }
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
                child: ChartStar(productName: widget._Product.name, listEarnings: listEarnings, SumEvaluate: 71,),
              ),
              Expanded(
                child: CommentProduct(product: widget._Product, id: widget.id,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
