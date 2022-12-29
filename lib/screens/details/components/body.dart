import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/screens/home/components/body.dart';

import '../../../models/product.dart';
class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _current = 0;
  double _opacity = 0;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: myData,
          carouselController: _controller,
          options: CarouselOptions(
              // autoPlayInterval: Duration(milliseconds: 300),
              // autoPlayAnimationDuration: Duration(milliseconds: 1),
              autoPlay: true,
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
                          // child: Image.network(myData2[index], _current == index ? 0.9 : 0.4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: _current == index
                                  ? DecorationImage(
                                      opacity: 1,
                                      image: NetworkImage(
                                        myData2[index],
                                      ))
                                  : DecorationImage(
                                      opacity: .4,
                                      image: NetworkImage(
                                        myData2[index],
                                      ))),),
                    ),
                    SizedBox(
                      width: 4,
                    )
                  ],
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Barang',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Rp 000.000,00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Consectetur anim proident exercitation ea culpa enim. Proident ullamco qui exercitation adipisicing irure voluptate sit non. Nostrud laboris anim quis ut dolor aliqua aute enim adipisicing et ut. Quis officia et non cillum.Quia quia sunt dolorum sit minima blanditiis libero dolor. Dolorum autem officiis sequi. Magnam tenetur debitis. Ut itaque dolor repellendus. Voluptatem architecto praesentium quam voluptatem rerum.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
