import 'package:flutter/material.dart';

enum ItemType {
  chair,
  bed,
  table,
}

class Products {
  final String Pid;
  final String name;
  //final String description;
  final String imageUrl;
  final double price;
  final double rate;
  //final List<Color> avaliableColors;
  final List<String> type;

  Products({
    required this.Pid,
    required this.name,
    //required this.description,
    required this.imageUrl,
    required this.price,
    required this.rate,
    //required this.avaliableColors,
    required this.type,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      Pid: json['_id'],
      name: json['name'],
      imageUrl: json['images'],
      price: json['price'],
      rate: json['score'],
      type: json['types'],
    );
  }

}
