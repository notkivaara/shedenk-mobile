import 'package:flutter/material.dart';
import 'package:shedenk_mobile/models/product.dart';
import 'package:shedenk_mobile/screens/details/components/body.dart';
import 'package:shedenk_mobile/screens/home/components/top_navbar2.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: TopNavBar2(),
        preferredSize: Size.fromHeight(50),
      ),
      body: Body(product: product),
    );
  }
}
