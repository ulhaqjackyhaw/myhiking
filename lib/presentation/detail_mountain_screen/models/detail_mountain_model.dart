import 'package:myhiking/models/jalur_model.dart';

class DetailMountainModel {
  final String name;
  final int height;
  final String province;
  // final List<Route> routes; // Ini bisa digunakan untuk data jalur dengan nama
  final List<Jalur>
      jalurList; // Ini untuk menyimpan data lengkap jalur dengan deskripsi, biaya, dll.

  DetailMountainModel({
    required this.name,
    required this.height,
    required this.province,
    // required this.routes,
    required this.jalurList,
  });

  factory DetailMountainModel.fromJson(Map<String, dynamic> json) {
    return DetailMountainModel(
        name: json['gunung']?['nama'] ?? 'Nama Gunung Tidak Ditemukan',
        // Ambil ketinggian, atau beri default 0 jika null
        height: json['gunung']?['ketinggian'] ?? 0,
        province: json['gunung']?['province'] ?? 'Nama Province Tidak Ditemukan',
        // routes: List<Route>.from(
        //     json['routes'].map((route) => Route.fromJson(route))),
        jalurList: List<Jalur>.from(
          json['data']?.map((jalur) => Jalur.fromJson(jalur)) ?? [],
        ));
  }
}

class Route {
  final String name;

  Route({required this.name});

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(name: json['nama']);
  }
}
