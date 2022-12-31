import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shedenk_mobile/app/modules/EditProfilePage/controllers/edit_profile_page_controller.dart';
import 'package:http/http.dart' as http;

class EditProfilePage extends StatefulWidget {
  // final Function(ImageSource source) onTap;
  // const EditProfilePage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FieldEditProfileController = Get.put(EditProfilePageController());

  String? id;
  String? nama;
  String? email;
  String? password;
  String? hobi;

  Future getDataProfile() async {
    try {
      final res = await http.get(
          Uri.parse("http://10.0.2.2/shedenk-web/service/loginservice.php"));

      if (res.statusCode == 200) {
        return jsonEncode(res.body);
        Iterable it = jsonDecode(res.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getDataProfile();
  }

  File? _image;
  Future _chooseImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    img = await _cropImage(imageFile: img);
    setState(() {
      _image = img;
    });
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? cropImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (cropImage == null) return null;
    return File(cropImage.path);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> editProfile() async {
      var url =
          Uri.parse("http://10.0.2.2/shedenk-web/service/loginservice.php");
      var response = await http.post(url, body: {
        "nama": FieldEditProfileController.NamaController.text.toString(),
        "email": FieldEditProfileController.EmailController.text.toString(),
        "password":
            FieldEditProfileController.PasswordForConfirm.text.toString(),
        "hobi": FieldEditProfileController.HobiController.text.toString(),
      });
      var data = jsonDecode(response.body);
      // print(dataJadi);
      if (data == "gagal") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("data sudah ada")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Edit Berhasil")),
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'nama', FieldEditProfileController.NamaController.text.toString());
        await prefs.setString('email',
            FieldEditProfileController.EmailController.text.toString());
        await prefs.setString('password',
            FieldEditProfileController.PasswordForConfirm.text.toString());
        await prefs.setString(
            'hobi', FieldEditProfileController.HobiController.text.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
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
                          width: 150,
                          height: 150,
                          // color: Colors.grey.withOpacity(0.3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: Colors.white),
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: ,
                            // ),
                          ),
                          child: Center(
                            child: _image == null
                                ? const Text('No Image')
                                : CircleAvatar(
                                    backgroundImage: FileImage(_image!),
                                    radius: 100,
                                  ),
                          ),
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
                                              _chooseImage(ImageSource.camera);
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
                                              _chooseImage(ImageSource.gallery);
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
                textformfield(
                    FieldEditProfileController.NamaController, 'Nama', false),
                SizedBox(
                  height: 10,
                ),
                textformfield(
                    FieldEditProfileController.EmailController, 'Email', false),
                // TextField(
                //   controller: FieldEditProfileController.HobiController,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       labelText: "Hobi"),
                // ),
                SizedBox(
                  height: 10,
                ),
                textformfield(
                    FieldEditProfileController.HobiController, 'Hobi', false),
                // TextField(
                //   controller: FieldEditProfileController.EmailController,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       labelText: "Email"),
                // ),
                SizedBox(
                  height: 10,
                ),
                textformfield(FieldEditProfileController.PasswordForConfirm,
                    'Masukkan Password', true),
                // TextField(
                //   controller: FieldEditProfileController.NomorTeleponController,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       labelText: "Nomor Telepon"),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // TextField(
                //   controller: FieldEditProfileController.PasswordForConfirm,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       labelText:
                //           "Masukkan Password untuk Konfirmasi Perubahan"),
                // ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  // style: ,
                  onPressed: () {
                    // editProfile();
                    getDataProfile();
                  },
                  child: Text("Simpan",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textformfield(controller, String text, bool obsuretxt) {
    return TextFormField(
      initialValue: nama,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Data tidak boleh kosong";
        } else {
          return null;
        }
      },
      obscureText: obsuretxt,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)),
        hintText: text,
      ),
    );
  }
}
