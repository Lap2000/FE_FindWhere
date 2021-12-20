import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/home_screen/home_screen.dart';
import 'package:project_flutter/Screens/models/product_model.dart';
import 'package:project_flutter/Screens/product_detail/Evaluate/enterprise_Evaluate.dart';
import 'package:project_flutter/Screens/product_detail/Evaluate/product_Evaluate.dart';
import 'package:project_flutter/Screens/product_detail/GoogleMap/Map.dart';
import 'package:project_flutter/components/BottomGuest.dart';

class ProdDetBottom extends StatelessWidget {
  final String id;
  final double price;
  final ProductModel _Product;

  const ProdDetBottom({
    Key? key,
    required this.price,
    required this.id,
    required ProductModel Product}) :_Product = Product,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.map_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MapScreen()),
              );
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductEvaluateScreen(id: id, Product: _Product,)),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 6, 156, 156),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Đánh giá sản phẩm',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnterpriseEvaluateScreen(id: id,)),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 6, 156, 156),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Đánh giá cửa hàng',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


/*onPressed: () {
ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
ScaffoldMessenger.of(context).showMaterialBanner(
MaterialBanner(
content: const Text('Chức năng này chưa hoàn thiện !'),
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
);*/