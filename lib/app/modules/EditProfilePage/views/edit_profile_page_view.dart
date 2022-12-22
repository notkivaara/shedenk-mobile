import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/controllers/edit_profile_page_controller.dart';
import 'package:shedenk_mobile/app/modules/ProfilePage/views/profile_page_view.dart';

class EditProfilePage extends StatelessWidget {
  final FieldForgotPasswordPageController =
      Get.put((EditProfilePageController));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              // shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          // color: Colors.grey.withOpacity(0.3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://tse4.mm.bing.net/th?id=OIP.pvIrpIuGDqd42wAtJwG0GAHaHa&pid=Api'))),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          child: InkWell(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Ambil Gambar",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            splashColor: Colors.grey,
                                            onTap: () {
                                              print("ea");
                                            },
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          margin: EdgeInsets.only(top: 10),
                                          child: InkWell(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Pilih Gambar",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            splashColor: Colors.grey,
                                            onTap: () {
                                              print("ea");
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(6),
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: Colors.blue),

                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Hobi"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller:,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  // controller: ,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Nomor Telepon"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                    // style: ,
                    onPressed: () {
                      Get.off(() => ProfilePage());
                    },
                    child: Text("Simpan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
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
