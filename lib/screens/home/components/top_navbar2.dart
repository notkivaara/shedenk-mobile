import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/CartPage/views/cart_page_view.dart';

class TopNavBar2 extends StatefulWidget {
  TopNavBar2({Key? key}) : super(key: key);

  @override
  State<TopNavBar2> createState() => _TopNavBar2State();
}

class _TopNavBar2State extends State<TopNavBar2> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    {
      return AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        // title: Container(
        //   height: 32.0,
        //   width: 222.0,
        //   child: TextField(
        //     textAlignVertical: TextAlignVertical.center,
        //     focusNode: _focusNodes[0],
        //     cursorColor: Colors.red,
        //     style: TextStyle(color: Colors.black),
        //     decoration: InputDecoration(
        //       prefixIcon: Icon(
        //         Icons.search,
        //         color: _focusNodes[0].hasFocus ? Colors.red : Colors.grey,
        //       ),
        //       filled: true,
        //       fillColor: Colors.grey.withOpacity(0.5),
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide.none,
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       focusColor: Colors.grey,
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide.none,
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       prefixIconColor: Colors.grey,
        //     ),
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 18.0, 0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              onPressed: () {
                Get.to(() => CartPage(keranjang: []));
              },
            ),
          ),
        ],
      );
    }
  }
}
