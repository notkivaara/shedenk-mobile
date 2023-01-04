import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/helpers.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:shedenk_mobile/constants.dart';
import 'package:shedenk_mobile/screens/home/components/categorries.dart';
import 'package:shedenk_mobile/screens/home/components/item_card.dart';
import 'package:http/http.dart' as http;

import '../../../models/product.dart';
import '../../../models/produktest.dart';
import '../../details/details_screen.dart';

class BodyHome extends StatefulWidget {
  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  List<Widget> myData = [];
  List? list;
  String? coba;
  String? imageData;
  List<Produktest> data2 = [];
  late Future data;
  String? res;

  Future getDataProduk() async {
    final response = await http
        .get(Uri.parse("http://shedenk.wstif3d.id/service/produkservice.php"));
    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      setState(() {
        list = msg;
      });
      return produktestFromJson(response.body.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future getDataKategori() async {
    final response = await http.get(
        Uri.parse("http://shedenk.wstif3d.id/service/kategoriservice.php"));
    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      print(msg);
      setState(() {
        // print(msg[0]['gambar'][1]['nama']);
        list = msg;
        print(list);
        // coba = msg;
      });
      return produktestFromJson(response.body.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    data = getDataProduk();
    data.then((value) {
      setState(() {
        data2 = value;
        list = data2
            .where((element) => element.gambar[0].idProduk == data2[0].id)
            .map((element) => element.gambar[0])
            .toList();
        print(list);
      });
    });
    super.initState();
  }

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
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: data2.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsScreen(
                    list: list![index]['gambar'].map((d) => d['nama']).toList(),
                    // file: data2[index].gambar[0].nama,
                    id: data2[index].id,
                    nama: data2[index].nama,
                    deskripsi: data2[index].deskripsi,
                    harga: data2[index].harga,
                    status: data2[index].status));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        spreadRadius: .1,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          color: Colors.grey.shade200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: data2[index].gambar.isEmpty
                              ? Center(child: Text("Tidak ada foto"))
                              : Image.network(
                                  "http://shedenk.wstif3d.id/upload/${data2[index].gambar[0].nama}",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        data2[index].nama,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      margin: EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Rp ' + data2[index].harga,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
