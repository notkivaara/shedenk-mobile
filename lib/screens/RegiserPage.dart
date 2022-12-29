import 'package:flutter/material.dart';
import 'package:shedenk_mobile/screens/LoginPage.dart';

class Rp extends StatefulWidget {
  @override
  State<Rp> createState() => _RpState();
}

class _RpState extends State<Rp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Daftar",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "img/logo.png",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  // controller: ,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  // controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  // controller: ,
                  // obscureText: ,
                  decoration: InputDecoration(
                      // suffixIcon: InkWell(
                      //   // onTap: toglePassword,
                      //   // child: Icon(Icons.visibility),
                      // ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "No. telepon"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  // controller: _namaController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Kata Sandi"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  // controller: _notelpController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Konfirmasi Kata Sandi"),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                // style: raiseButtonStyle,
                onPressed: () {
                  // RegisterSubmit();
                  // addData();
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sudah punya akun?",
                  style: TextStyle(fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
