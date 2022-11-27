import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shedenk_mobile/constants.dart';
import 'package:shedenk_mobile/screens/home/components/categorries.dart';

import '../../../models/product.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 121,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 121,
                    width: 222,
                    margin: EdgeInsets.all(10),
                    child: Image.network("https://picsum.photos/222/121"),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 380,
          child: Text(
            "Rekomendasi untuk anda",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75),
                itemBuilder: (context, index) =>
                    ItemCard(product: products[index])),
          ),
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  // final Function press;

  const ItemCard({
    Key? key,
    required this.product,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey),
          child: Image.network("https://picsum.photos/200"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            product.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text("Rp 100.000"),
      ],
    );
  }
}
