import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'Tentang Toko',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey,
            child: SizedBox(
              height: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shedenk Store",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "Shedenk store merupakan toko thrift yang menyediakan berbagai macam......"),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Kontak Kami",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
