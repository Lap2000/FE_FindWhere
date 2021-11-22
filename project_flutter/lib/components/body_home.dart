import 'package:flutter/material.dart';
import 'package:project_flutter/utilities/constant.dart';

import 'body_recommend.dart';
import 'header.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          Recomends(),
          //TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          //FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}