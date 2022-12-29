import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  bool? value = false;
  bool isShowDetailPesanan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        // color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 1, color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text(
                    'Rp 000.000,00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 1,
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
                      onPressed: () {},
                      child: Text("Lanjutkan"),
                    ),
                  );
                },
                child: Text('Bayar'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Keranjang",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
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
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Barang"),
                        Text(
                          "Rp 000.000,00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Hapus dari keranjang'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.blue.shade300)),
                  ),
                  child: isShowDetailPesanan
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Pesanan',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Nama Barang'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('qty'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('Rp 000.000,00'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Nama Barang'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('qty'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('Rp 000.000,00'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Nama Barang'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('qty'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('Rp 000.000,00'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Nama Barang'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('qty'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('Rp 000.000,00'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pesanan',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Jumlah Barang'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('qty'),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                Positioned.fill(
                  top: -23,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30, 30),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: CircleBorder(
                            side: BorderSide(width: 1, color: Colors.blue)),
                      ),
                      onPressed: () {
                        setState(() {
                          isShowDetailPesanan = !isShowDetailPesanan;
                        });
                      },
                      child: isShowDetailPesanan
                          ? Icon(
                              Icons.expand_less,
                              color: Colors.blue,
                            )
                          : Icon(
                              Icons.expand_more,
                              color: Colors.blue,
                            ),
                    ),
                    // Container(
                    //   height: 30,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //       width: 1,
                    //       color: Colors.blue.shade300,
                    //     ),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.expand_more,
                    //       color: Colors.blue.shade300,
                    //     ),
                    //   ),
                    // ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
