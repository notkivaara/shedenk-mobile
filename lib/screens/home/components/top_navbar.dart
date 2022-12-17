import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopNavBar extends StatefulWidget {
  TopNavBar({Key? key}) : super(key: key);

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
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
    return topNavBar();
  }
}

List<Map<String, dynamic>> myList = [
  {"category": "Kaos", "id": 1},
  {"category": "Celana", "id": 2},
  {"category": "Hoodie", "id": 3},
];
List<FocusNode> _focusNodes = [
  FocusNode(),
  FocusNode(),
];

AppBar topNavBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 100,
    leading: DropdownSearch<Map<String, dynamic>>(
      popupProps: PopupProps.menu(
        itemBuilder: (context, item, isSelected) => ListTile(
          title: Text(
            item["category"].toString(),
          ),
        ),
      ),
      dropdownBuilder: (context, selectedItem) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          selectedItem?["category"].toString() ?? "Kategori",
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ),
      items: myList,
      dropdownButtonProps: DropdownButtonProps(isVisible: false),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
      onChanged: (value) => print(value?["id"] ?? null),
    ),
    title: Container(
      height: 32.0,
      width: 222.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: _focusNodes[0],
        cursorColor: Colors.red,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: _focusNodes[0].hasFocus ? Colors.red : Colors.grey,
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Colors.grey,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIconColor: Colors.grey,
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 18.0, 0),
        child: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
    ],
  );
}
