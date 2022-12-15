import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/views/edit_profile_page_view.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  final SettingController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ColoredBox(
                          color: Color.fromARGB(255, 194, 128, 128),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Zainul Karim",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "+62 85123456789",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "zainulkarim@gmail.com",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => EditProfilePage());
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                // color: Colors.amber,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ubah Kata Sandi",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                        splashColor: Colors.grey,
                                        onPressed: () {},
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        color: Color(0xFFD9D9D9)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          // width: 250,
                          height: 60,
                          child: TextField(
                            controller:
                                SettingController.PasswordLamaController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Kata Sandi Lama"),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          // width: 250,
                          height: 60,
                          child: TextField(
                            controller:
                                SettingController.PasswordBaruController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Kata Sandi Baru"),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          // width: 250,
                          height: 60,
                          child: TextField(
                            controller:
                                SettingController.KonfirmasiPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Konfirmasi Kata Sandi"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            // style: ,
                            onPressed: () {},
                            child: Text("Simpan",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            Get.off(() => LoginPage());
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
