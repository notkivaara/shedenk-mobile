import 'package:flutter/material.dart';

import '../../../models/product.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [SingleChildScrollView()]);
  }
}
