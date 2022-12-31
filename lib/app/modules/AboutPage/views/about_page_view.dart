import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shedenk_mobile/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:mailto/mailto.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:android_intent_plus/android_intent.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<String> list = [
    'assets/img/about1.jpg',
    'assets/img/about2.jpg',
    'assets/img/about3.jpg',
  ];

  Position baseposition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Toko',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
              color: Colors.amber,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                ),
                items: list.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shedenk Store",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "Shedenk store merupakan toko thrift yang menyediakan berbagai macam......"),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Kontak Kami",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()
                          // print("WhatsApp");
                          // OpenWa();
                          {
                        launchUrlString('https://wa.me/6285156262237');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/wa.svg',
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Fb");
                        launchUrlString('https://www.facebook.com/fredaart');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/fb.svg',
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrlString(
                            'https://instagram.com/shedenkstuff?igshid=OGQ2MjdiOTE=');
                        print("Instagram");
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ig.svg',
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final mailto = Mailto(
                            to: ['bocah123fb@gmail.com'],
                            subject: 'Hi',
                            body: 'Kamu nanyea??');
                        await launch('$mailto');
                        print("Gmail");
                      },
                      child: SvgPicture.asset(
                        'assets/icons/gmail.svg',
                        height: 35,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Maps");
                        final intent = AndroidIntent(
                            action: 'action_view',
                            data: Uri.encodeFull(
                                'google.navigation:q=jember&avoid=tf'),
                            package: 'com.google.android.apps.maps');
                        intent.launch();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/gmaps.svg',
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(Placemark);
    Placemark place = placemarks[0];
    setState(() {
      String address =
          '${place.street}, ${place.subLocality}, ${place.locality},${place.postalCode}, ${place.country}';
    });
  }
}

// OpenWa() async {
//   var whatsapp = "6285156262237";
//   if (Platform.isIOS) {
//     if (await canLaunchUrl(
//         Uri.parse("https://wa.me/$whatsapp?text=${Uri.parse("")}"))) {
//       await launchUrl(
//           Uri.parse("https://wa.me/$whatsapp?text=${Uri.parse("")}"));
//     } else {
//       Get.snackbar("Hayolo", "Turu");
//     }
//   } else {
//     if (await canLaunchUrl(Uri.parse("https://wa.me/$whatsapp?text=df"))) {
//       await launchUrl(Uri.parse("https://wa.me/$whatsapp?text=df"));
//     } else {
//       Get.snackbar("Hayolo", "Turu");
//     }
//   }
// }
