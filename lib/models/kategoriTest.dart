import 'package:meta/meta.dart';
import 'dart:convert';

List<KategoriTest> kategoriTestFromJson(String str) => List<KategoriTest>.from(json.decode(str).map((x) => KategoriTest.fromJson(x)));

String kategoriTestToJson(List<KategoriTest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriTest {
    KategoriTest({
        required this.id,
        required this.nama,
    });

    final String id;
    final String nama;

    factory KategoriTest.fromJson(Map<String, dynamic> json) => KategoriTest(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}
