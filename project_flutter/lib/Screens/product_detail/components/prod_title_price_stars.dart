import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';

class ProdTitleStars extends StatefulWidget {
  final String title;
  final double rate;
  final double price;
  final List<String> types;
  final String id_enterprise;

  const ProdTitleStars({
    Key? key,
    required this.title,
    required this.rate, required this.price, required this.types, required this.id_enterprise,
  }) : super(key: key);

  @override
  State<ProdTitleStars> createState() => _ProdTitleStarsState();
}

class _ProdTitleStarsState extends State<ProdTitleStars> {

  late String E_name='';
  late int lat=0;
  late int lng=0;
  void Init() async {
    dynamic enterprise = await APIsv().fetchEnterprise(widget.id_enterprise);
    setState(() {
      E_name = enterprise['name'];
      // lat = enterprise['lat'];
      // lng = enterprise['lng'];
    });
  }

  @override
  void initState() {
    Init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[800],
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.rate.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Loại sản phẩm: '+widget.types.toString(),
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Giá:     '+widget.price.toString()+'   VND',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Doanh nghiệp:  '+E_name,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        // Text(
        //   'Địa chỉ: '+lat.toString()+'  ,   '+lng.toString(),
        //   style: TextStyle(
        //     color: Colors.black87,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16,
        //   ),
        // ),
        // const SizedBox(height: 10),
        Text(
          'Khoảng cách:',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
