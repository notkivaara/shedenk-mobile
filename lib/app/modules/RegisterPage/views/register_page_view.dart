import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';
import 'package:shedenk_mobile/app/modules/RegisterPage/controllers/register_page_controller.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  final FieldRegisterController = Get.put(RegisterPageController());
  // Future<void> _Register() async {
  //   Uri url = Uri.parse(
  //       "http://10.0.2.2/shedenk-web/service/registerservice.php?nama=${FieldRegisterController.NamaController.text.toString()}&email=${FieldRegisterController.EmailController.text.toString()}&password=${FieldRegisterController.PasswordOneController.text.toString()}&hobi=${FieldRegisterController.HobiController.text.toString()}");

  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //Server response into variable
  // print(response.body);
  // print('Register Nih Bos');
  // Get.off(() => LoginPage());
  //   }
  // }

  Future<void> _Register() async {
    Uri url =
        Uri.parse("http://10.0.2.2/shedenk-web/service/registerservice.php");
    var response = await http.post(url, body: {
      "nama": FieldRegisterController.NamaController.text.toString(),
      "email": FieldRegisterController.EmailController.text.toString(),
      "password": FieldRegisterController.PasswordOneController.text.toString(),
      "hobi": FieldRegisterController.HobiController.text.toString(),
      // "no_hp": nohp.text,
      // "role": "2",
    });
    print('berhasil');
    // Get.off(() => LoginPage());
  }

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/img/logo.png",
                height: 130,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextField(
                controller: FieldRegisterController.NamaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Nama"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextField(
                controller: FieldRegisterController.EmailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Email"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextField(
                controller: FieldRegisterController.HobiController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Hobi"),
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            // TextField(
            //   controller: FieldRegisterController.TelpController,
            //   // obscureText: ,
            //   decoration: InputDecoration(
            // suffixIcon: InkWell(
            //   // onTap: toglePassword,
            //   // child: Icon(Icons.visibility),
            // ),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       labelText: "No. telepon"),
            // ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextField(
                controller: FieldRegisterController.PasswordOneController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Kata Sandi"),
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            // SizedBox(
            //   width: 250,
            //   height: 60,
            //   child: TextField(
            //     controller: FieldRegisterController.PasswordTwoController,
            //     obscureText: true,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         labelText: "Konfirmasi Kata Sandi"),
            //   ),
            // ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _Register();
                // print('gagal');
              },
              child: Text(
                "Daftar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
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
                    Get.off(() => LoginPage());
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
