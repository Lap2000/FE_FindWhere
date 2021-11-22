import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class StarLine {
  final String rate;
  final int amount;
  final charts.Color barColor;

  StarLine({
    required this.rate,
    required this.amount,
    required this.barColor
  });
}



class ChartStar extends StatelessWidget {
  final String productName;
  final int SumEvaluate;

  late final List<StarLine> listEarnings;
  ChartStar({required this.listEarnings, required this.productName, required this.SumEvaluate});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<StarLine, String>> series = [
      charts.Series(
          id: "star",
          data: listEarnings,
          domainFn: (StarLine series, _) => series.rate,
          measureFn: (StarLine series, _) => series.amount,
          colorFn: (StarLine series, _) => series.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Biểu đồ đánh giá sản phẩm " + productName,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(child: charts.BarChart(series,animate: true,)),
              Text(
                "Tổng số lượng đánh giá: " +SumEvaluate.toString(),
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

