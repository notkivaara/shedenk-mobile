import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'components/top_navbar.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 70,
        leading: TextButton(
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: Text(
            "Kategori",
            style: TextStyle(color: Colors.black),
          ),
        ),
        shadowColor: Colors.black.withOpacity(isShow ? 0 : 1),
        title: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade200),
          padding: EdgeInsets.only(left: 8),
          child: TextField(
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        BodyHome(),
        isShow ? kategori() : Container(),
      ]),
    );
  }
}

class kategori extends StatelessWidget {
  const kategori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .14,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baju",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baju",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baju",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Baju",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Baju",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
