import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/RegisterPage/views/register_page_view.dart';

class RatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 120,
                color: Colors.amber,
              ),
              Text(
                "999",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "99 Ulasan",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Diperbarui pada tanggal _/_/_",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonRate(),
              buttonRate(),
              buttonRate(),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonRate(),
              buttonRate(),
              buttonRate(),
            ],
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Nama"),
            subtitle: Container(
              color: Colors.amber,
              child: Row(
                children: [
                  Row(
                    children: [
                      starSmall(),
                      starSmall(),
                      starSmall(),
                      starSmall(),
                      starSmall(),
                    ],
                  ),
                  VerticalDivider(
                    width: 5,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    "Coba",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                starSmall(),
                starSmall(),
                starSmall(),
                starSmall(),
                starSmall(),
              ],
            ),
            Text("000 Ulasan")
          ],
        ),
      ),
    );
  }
}

class starSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 20,
    );
  }
}
