import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shedenk_mobile/app/modules/LoginPage/views/login_page_view.dart';
import 'package:shedenk_mobile/app/modules/RegisterPage/controllers/register_page_controller.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FieldRegisterController = Get.put(RegisterPageController());

  // Future<void> _Register() async {
  Future<void> _Register() async {
    Uri url =
        Uri.parse("http://10.0.2.2/shedenk-web/service/registerservice.php");
    var response = await http.post(url, body: {
      "nama": FieldRegisterController.NamaController.text.toString(),
      "email": FieldRegisterController.EmailController.text.toString(),
      "password": FieldRegisterController.PasswordOneController.text.toString(),
      "hobi": FieldRegisterController.HobiController.text.toString(),
      // "gambar": "",
      // "no_hp": nohp.text,
      // "role": "2",
    });
    // print('berhasil');
    // Get.off(() => LoginPage());
  }

  // File? _image;

  // Future _chooseImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source:  source);
  //   if (image == null) return;
  //   File? img = File(image.path);
  //   img = await _cropImage(imageFile: img);
  //   setState(() {
  //     _image = img;
  //     print(_image);
  //   });
  // }

  // var gambar;

  // Future<File?> _cropImage({required File imageFile}) async {
  //   CroppedFile? cropImage =
  //       await ImageCropper().cropImage(sourcePath: imageFile.path);
  //   if (cropImage == null) return null;
  //   print(_image);
  //   setState(() {
  //     gambar = cropImage.path;
  //   });
  //   return File(cropImage.path);
  // }

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    var uri = "http://10.0.2.2/shedenk-web/service/registerservice.php";

    var request = http.MultipartRequest('POST', Uri.parse(uri));

    if (img != null) {
      var pic = await http.MultipartFile.fromPath("image", img.path);

      request.files.add(pic);

      await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = jsonDecode(response.body);

          // show snackbar if input data successfully
          final snackBar = SnackBar(content: Text(message['message']));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          //get new list images
          getImageServer();
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  Future getImageServer() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2/shedenk-web/service/registerservice.php'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          image = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getImageServer();
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // void submitForm() async {
  //   String encodeImage = "";

  //   if(.path.isNotEmpty) {

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListView(
            shrinkWrap: true,
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
                          color: Colors.grey.shade100,
                          border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.grey.shade400),
                          shape: BoxShape.circle,
                          // image: DecorationImage(
                          //   fit: BoxFit.cover,
                          //   image: ,
                          // ),
                        ),
                        child: Center(
                          child: Text('No Profile'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
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
                                            sendImage(ImageSource.camera);
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
                                            sendImage(ImageSource.gallery);
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
                height: 16,
              ),
              TextField(
                controller: FieldRegisterController.NamaController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: "Nama",
                  // labelText: "Nama",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: FieldRegisterController.EmailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: "Email",
                  // labelText: "Email",
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
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: InputBorder.none,
                    hintText: "Hobi",
                  ),
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
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: InputBorder.none,
                    hintText: "Kata Sandi",
                  ),
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
        ));
  }
}
