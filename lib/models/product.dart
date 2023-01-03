import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  String nama;
  Product({required this.nama});

  Future<void> getDataProduk() async {
    Uri url = Uri.parse(
        "http://10.0.2.2/shedenk-web/service/produkservice.php?list:$nama");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final msg = jsonDecode(response.body);
      print(nama);
    }

    // List<Product> list = [
    //   Product(
    //     nama: nama,

    //     // title: "Office Code",
    //     // price: 234,
    //     // size: 12,
    //     // description: dummyText,
    //     // image: "assets/images/bag_1.png",
    //     // color: Color(0xFF3D82AE)),

    //     // Product(
    //     //     id: 2,
    //     //     title: "Belt Bag",
    //     //     price: 234,
    //     //     size: 8,
    //     //     description: dummyText,
    //     //     image: "assets/images/bag_2.png",
    //     //     color: Color(0xFFD3A984)),
    //     // Product(
    //     //     id: 3,
    //     //     title: "Hang Top",
    //     //     price: 234,
    //     //     size: 10,
    //     //     description: dummyText,
    //     //     image: "assets/images/bag_3.png",
    //     //     color: Color(0xFF989493)),
    //     // Product(
    //     //     id: 4,
    //     //     title: "Old Fashion",
    //     //     price: 234,
    //     //     size: 11,
    //     //     description: dummyText,
    //     //     image: "assets/images/bag_4.png",
    //     //     color: Color(0xFFE6B398)),
    //     // Product(
    //     //     id: 5,
    //     //     title: "Office Code",
    //     //     price: 234,
    //     //     size: 12,
    //     //     description: dummyText,
    //     //     image: "assets/images/bag_5.png",
    //     //     color: Color(0xFFFB7883)),
    //     // Product(
    //     //   id: 6,
    //     //   title: "Office Code",
    //     //   price: 234,
    //     //   size: 12,
    //     //   description: dummyText,
    //     //   image: "assets/images/bag_6.png",
    //     //   color: Color(0xFFAEAEAE),
    //   ),
    // ];
  }
}
