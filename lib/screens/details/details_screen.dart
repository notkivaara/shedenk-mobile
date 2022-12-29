import 'package:flutter/material.dart';
import 'package:shedenk_mobile/models/product.dart';
import 'package:shedenk_mobile/screens/details/components/body.dart';
import 'package:shedenk_mobile/screens/home/components/top_navbar2.dart';
import '../home/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        // color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(0, 50),
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  side: BorderSide(width: 2, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: Icon(Icons.add_shopping_cart),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Text('Beli'),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        child: TopNavBar2(),
        preferredSize: Size.fromHeight(50),
      ),
      body: Body(product: product),
    );
  }
}
