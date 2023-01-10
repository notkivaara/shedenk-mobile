import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';

import '../controllers/forgot_password_page_controller.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatelessWidget {
  final FieldForgotPasswordPageController =
      Get.put(ForgotPasswordPageController());

  Future<void> PostEmail() async {
    var url = Uri.parse("http://shedenk.wstif3d.id/service/lupapassword.php");
    var response = await http.post(url, body: {
      "email":
          FieldForgotPasswordPageController.EmailController.text.toString(),
      // "hobi": FieldForgotPasswordPageController.HobiController.text.toString(),
      "password": FieldForgotPasswordPageController.PasswordBaruController.text
          .toString(),
    });
    print('berhasil');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Password',
          // style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image.asset(
                  "assets/img/logo.png",
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: FieldForgotPasswordPageController.EmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email"),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                // TextFormField(
                //   controller: FieldForgotPasswordPageController.HobiController,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       labelText: "Hobi"),
                // ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller:
                      FieldForgotPasswordPageController.PasswordBaruController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password Baru"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    PostEmail();
                    // Get.to(() => NextPage());
                  },
                  child: Text("Lanjutkan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class NextPage extends StatefulWidget {
//   @override
//   State<NextPage> createState() => _NextPageState();
// }

// class _NextPageState extends State<NextPage> {
//   final FieldForgotPasswordPageController =
//       Get.put(ForgotPasswordPageController());
//   Future<void> validasi() async {
//     var url = Uri.parse("http://shedenk.wstif3d.id/service/lupapassword.php");
//     var response = await http.post(url, body: {
//       "hobi": FieldForgotPasswordPageController.HobiController.text.toString(),
//       "passworrd": FieldForgotPasswordPageController.PasswordBaruController.text
//           .toString(),
//     });
//     print('berhasil');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//         'Lupa Password',
//       )),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         alignment: Alignment.center,
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             Image.asset(
//               "assets/img/logo.png",
//               height: 150,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: FieldForgotPasswordPageController.HobiController,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   labelText: "Hobi"),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             TextFormField(
//               controller:
//                   FieldForgotPasswordPageController.PasswordBaruController,
//               obscureText: true,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   labelText: "Password Baru"),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 validasi();
//               },
//               child: Text("Konfirmasi",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(MediaQuery.of(context).size.width, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
