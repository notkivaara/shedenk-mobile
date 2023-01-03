// To parse this JSON data, do
//
//     final produktest = produktestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Produktest> produktestFromJson(String str) =>
    List<Produktest>.from(json.decode(str).map((x) => Produktest.fromJson(x)));

String produktestToJson(List<Produktest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produktest {
  Produktest({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.idKategori,
    required this.harga,
    required this.status,
    required this.gambar,
  });

  final String id;
  final String nama;
  final String deskripsi;
  final String idKategori;
  final String harga;
  final String status;
  final List<Gambar> gambar;

  factory Produktest.fromJson(Map<String, dynamic> json) => Produktest(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        idKategori: json["id_kategori"],
        harga: json["harga"],
        status: json["status"],
        gambar:
            List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "id_kategori": idKategori,
        "harga": harga,
        "status": status,
        "gambar": List<dynamic>.from(gambar.map((x) => x.toJson())),
      };
}

class Gambar {
  Gambar({
    required this.idProduk,
    required this.nama,
  });

  final String idProduk;
  final String nama;

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        idProduk: json["id_produk"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "nama": nama,
      };

}
