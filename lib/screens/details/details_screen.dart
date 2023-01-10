import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shedenk_mobile/app/modules/CartPage/views/cart_page_view.dart';
import 'package:shedenk_mobile/models/product.dart';
import 'package:shedenk_mobile/models/produktest.dart';
import 'package:shedenk_mobile/screens/home/components/top_navbar2.dart';
import 'package:shedenk_mobile/screens/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../home/components/body.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

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
  bool? value = false;

  final CarouselController _controller = CarouselController();

  List<Gambar> myData2 = [];
  List<Widget> imageData = [];
  List<CartPage> keranjang = [];

  @override
  void initState() {
    super.initState();
    List<Widget> image = [];
    for (int i = 0; i <= widget.list!.length - 1; i++) {
      image.add(Image.network(
          "http://shedenk.wstif3d.id/upload/${widget.list![i]}",
          fit: BoxFit.cover));
      imageData = image;
    }
  }

  void _addwidget() {
    setState(() {
      Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
                activeColor: Colors.blue,
                value: value,
                onChanged: (Value) {
                  setState(() {
                    this.value = Value;
                  });
                }),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  // color: ,
                  image: DecorationImage(
                      image: AssetImage('assets/img/about1.jpg')),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.nama),
                Text(
                  widget.harga,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Hapus dari keranjang'),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  final snackbar = const SnackBar(
    content: Text("Enter valid mobile number"),
    backgroundColor: Colors.red,
  );

  void sendMessage(context) {
    var phone = '+6281333085303';
    var message = 'Saya ingin memesan: ' +
        '\n' +
        'Id: ' +
        '${widget.id}' +
        '\n' +
        'nama Barang: ' +
        '${widget.nama}' +
        '\n' +
        'Harga: ' +
        '${widget.harga}';
    if (phone.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      _launchURL(phone, message);
    }
  }

  void _launchURL(phone, message) async => await canLaunch(
          'https://api.whatsapp.com/send?phone=$phone&text=$message')
      ? await launch('https://api.whatsapp.com/send?phone=$phone&text=$message')
      : throw 'Could not launch WhatsApp';

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
                onPressed: () {
                  _addwidget();
                  print(keranjang.toString());
                },
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
                onPressed: () {
                  Get.defaultDialog(
                    contentPadding: EdgeInsets.all(10),
                    title: '',
                    titleStyle: TextStyle(fontSize: 0),
                    content: Text(
                      'Anda akan dialihkan ke Whatsapp untuk pembayaran',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    cancel: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * .25, 40)),
                        overlayColor: MaterialStateProperty.all(
                            Colors.red.withOpacity(.2)),
                        side: MaterialStateProperty.all(
                            BorderSide(width: 2, color: Colors.red)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Batal",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    confirm: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * .25, 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () {
                        sendMessage(context);
                        Get.off(() => MainPage());
                      },
                      child: Text("Lanjutkan"),
                    ),
                  );
                },
                child: Text('Beli'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      // PreferredSize(
      //   child: TopNavBar2(),
      //   preferredSize: Size.fromHeight(50),
      // ),
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
                                        'http://shedenk.wstif3d.id//upload/${widget.list![index]}'))
                                : DecorationImage(
                                    opacity: .4,
                                    image: NetworkImage(
                                        'http://shedenk.wstif3d.id//upload/${widget.list![index]}')),
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
