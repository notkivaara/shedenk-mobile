import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shedenk_mobile/models/product.dart';
import 'package:shedenk_mobile/models/produktest.dart';
import 'package:shedenk_mobile/screens/home/components/top_navbar2.dart';
import '../home/components/body.dart';
import 'package:carousel_slider/carousel_controller.dart';

class DetailsScreen extends StatefulWidget {
  List<dynamic>? list;
  final String id;
  final String nama;
  final String deskripsi;
  final String harga;
  final String status;

  DetailsScreen(
      {Key? key,
      required this.list,
      required this.id,
      required this.nama,
      required this.deskripsi,
      required this.harga,
      required this.status})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _current = 0;
  double _opacity = 0;

  final CarouselController _controller = CarouselController();

  List<Gambar> myData2 = [];
  List<Widget> imageData = [];

  @override
  void initState() {
    super.initState();
    List<Widget> image = [];
    for (int i = 0; i <= widget.list!.length - 1; i++) {
      image.add(Image.network(
          "http://10.0.2.2/shedenk-web/upload/${widget.list![i]}",
          fit: BoxFit.cover));
      imageData = image;
    }
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: imageData,
            carouselController: _controller,
            options: CarouselOptions(
                // autoPlayInterval: Duration(milliseconds: 300),
                // autoPlayAnimationDuration: Duration(milliseconds: 1),
                autoPlay: true,
                enlargeCenterPage: false,
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
                itemCount: widget.list!.length,
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
                                        'http://10.0.2.2/shedenk-web/upload/${widget.list![index]}'))
                                : DecorationImage(
                                    opacity: .4,
                                    image: NetworkImage(
                                        'http://10.0.2.2/shedenk-web/upload/${widget.list![index]}')),
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nama,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Rp ' + widget.harga,
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
                  widget.deskripsi,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                // Image.network(
                //     '')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
