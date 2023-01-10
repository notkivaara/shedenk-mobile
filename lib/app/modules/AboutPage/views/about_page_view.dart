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
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> myData = [
    Image.asset(
      'assets/img/about1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/img/about2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/img/about3.jpg',
      fit: BoxFit.fill,
    ),
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

  void sendMessage(context) {
    var phone = '+6281333085303';
    var message = '';
    //   if (phone.length < 9) {
    //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
    //   } else {
    //     _launchURL(phone, message);
    //   }
  }

  void _launchURL(phone, message) async => await canLaunch(
          'https://api.whatsapp.com/send?phone=$phone&text=$message')
      ? await launch('https://api.whatsapp.com/send?phone=$phone&text=$message')
      : throw 'Could not launch WhatsApp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Toko',
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: myData,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlay: true,
                      disableCenter: true,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      aspectRatio: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Container(
                // color: Colors.amber,
                height: 40,
                width: 14.0 * myData.length,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myData.length,
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.animateToPage(index);
                            },
                            child: Container(
                              // color: Colors.amber,
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                                    .withOpacity(_current == index ? 0.9 : 0.4),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
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
                    "Shedenk Thrift Shop adalah Sebuah Toko yang bergerak di bidang Pakaian yang dimana Produk Pakainnya Sendiri Merupakan Pakaian Bekas Berkualitas. Pada tahun 2015 Shedenk Thrift Shop Mulai Dibuka, pada masa itu Produk Thrift menjadi pakaian tren anak muda"),
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
