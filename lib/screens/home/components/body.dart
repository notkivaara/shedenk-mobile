import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shedenk_mobile/constants.dart';
import 'package:shedenk_mobile/screens/home/components/categorries.dart';
import 'package:shedenk_mobile/screens/home/components/item_card.dart';

import '../../../models/product.dart';
import '../../details/details_screen.dart';

class BodyHome extends StatefulWidget {
  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  List<Widget> myData = [
    // Image.network("https://picsum.photos/500/500", fit: BoxFit.cover),
    // Image.network("https://picsum.photos/350/500", fit: BoxFit.cover),
    // Image.network("https://picsum.photos/350/500", fit: BoxFit.cover),
    Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://picsum.photos/500/500",
            ),
            fit: BoxFit.cover),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                items: myData,
                carouselController: _controller,
                options: CarouselOptions(
                    // autoPlayInterval: Duration(seconds: 4),
                    // autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Container(
              // color: Colors.amber,
              height: 40,
              width: 14.0 * myData.length,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _controller.animateToPage(index);
                          },
                          child: Container(
                            // color: Colors.amber,
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                                  .withOpacity(_current == index ? 0.9 : 0.4),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8, left: 8, right: 8),
          child: Container(
            child: Text(
              "Rekomendasi untuk anda",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // GridView.builder(
        //   itemCount: products.length,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: kDefaultPaddin,
        //       crossAxisSpacing: kDefaultPaddin,
        //       childAspectRatio: 0.75),
        //   itemBuilder: (context, index) => ItemCard(
        //     product: products[index],
        //     press: () => Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => DetailsScreen(
        //           product: products[index],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            for (int i = 0; i < products.length; i++)
              ItemCard(
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[i],
                    ),
                  ),
                ),
                product: products[i],
              ),
          ],
        )
      ],
    );
  }
}
