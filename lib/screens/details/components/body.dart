import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _current = 0;
  int _current1 = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> myData = [
    Image.network("https://picsum.photos/500/500", fit: BoxFit.cover),
    Image.network("https://picsum.photos/350/500", fit: BoxFit.cover),
    Image.network("https://picsum.photos/350/500", fit: BoxFit.cover),
  ];
  List<String> myData2 = [
    "https://picsum.photos/500/500",
    "https://picsum.photos/350/500",
    "https://picsum.photos/350/500",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: myData,
        carouselController: _controller,
        options: CarouselOptions(
            // autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Container(
        height: 60,
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
                        height: 40,
                        width: 40,
                        child: Image.network(myData2[index]),
                        decoration: BoxDecoration(
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(_current == index ? 0.9 : 0.4))),
                  ),
                  SizedBox(
                    width: 4,
                  )
                ],
              );
            }),
      ),
    ]);
    // child: Container(
    //   width: 30.0,
    //   height: 30.0,
    //   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    //   decoration: BoxDecoration(
    //       image:
    //           DecorationImage(image: NetworkImage(myData2.)),
    //       color: (Theme.of(context).brightness == Brightness.dark
    //               ? Colors.white
    //               : Colors.black)
    //           .withOpacity(_current == entry.key ? 0.9 : 0.4)),
    //   child:,
    // ),
  }
}
