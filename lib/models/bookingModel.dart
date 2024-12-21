import 'dart:convert';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  bool success;
  String message;
  ModelBooking data;

  Booking({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      success: json["success"],
      message: json["message"],
      data:
          ModelBooking.fromJson(json["pesanan"]), // Directly passing 'pesanan'
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "pesanan": data.toJson(),
      };
}

class ModelBooking {
  final int id;
  final int idGunung;
  final int jalurId;
  final int userId;
  final DateTime tanggalNaik;
  final DateTime tanggalTurun;
  final int totalHargaTiket;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<Anggota>? anggotaIds;
  // final GunungBooking? gunung; // Made nullable
  // final JalurBooking? jalur; // Made nullable

  ModelBooking({
    required this.id,
    required this.idGunung,
    required this.jalurId,
    required this.userId,
    required this.tanggalNaik,
    required this.tanggalTurun,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.totalHargaTiket,
    this.anggotaIds,
    // this.gunung, // Nullable field
    // this.jalur, // Nullable field
  });

  factory ModelBooking.fromJson(Map<String, dynamic> json) {
    return ModelBooking(
      id: json['id'],
      idGunung: json['id_gunung'],
      jalurId: json['id_jalur'],
      userId: json['id_user'],
      tanggalNaik: DateTime.parse(json['tanggal_naik']),
      tanggalTurun: DateTime.parse(json['tanggal_turun']),
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      totalHargaTiket: json['total_harga_tiket'],
      anggotaIds: json['anggota_ids'] != null
          ? (json['anggota_ids'] as List)
              .map((item) => Anggota.fromJson(item))
              .toList()
          : [],
      // gunung: json['gunung'] != null
      //     ? GunungBooking.fromJson(json['gunung'])
      //     : null, // Null check
      // jalur: json['jalur'] != null
      //     ? JalurBooking.fromJson(json['jalur'])
      //     : null, // Null check
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_gunung': idGunung,
      'id_jalur': jalurId,
      'id_user': userId,
      'tanggal_naik': tanggalNaik.toIso8601String(),
      'tanggal_turun': tanggalTurun.toIso8601String(),
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'total_harga_tiket': totalHargaTiket,
      'anggota_ids': anggotaIds != null
          ? anggotaIds!.map((anggota) => anggota.toJson()).toList()
          : [],
      // 'gunung': gunung?.toJson(), // Safe null check before calling toJson
      // 'jalur': jalur?.toJson(), // Safe null check before calling toJson
    };
  }
}

class Anggota {
  final int id;
  final String name;
  final String email;

  Anggota({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Anggota.fromJson(Map<String, dynamic> json) {
    return Anggota(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

// class JalurBooking {
//   final int id;
//   final String nama;
//   final String village;
//   final String district;
//   final String regency;
//   final String province;
//   final String gambar;
//   final double biaya;
//   final GunungBooking gunung;

//   JalurBooking({
//     required this.id,
//     required this.nama,
//     required this.village,
//     required this.district,
//     required this.regency,
//     required this.province,
//     required this.gambar,
//     required this.biaya,
//     required this.gunung,
//   });

//   factory JalurBooking.fromJson(Map<String, dynamic> json) {
//     return JalurBooking(
//       id: json['id'],
//       nama: json['nama'],
//       village: json['village'],
//       district: json['district'],
//       regency: json['regency'],
//       province: json['province'],
//       gambar: json['gambar'],
//       biaya: json['biaya'].toDouble(),
//       gunung: GunungBooking.fromJson(json['gunung']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nama": nama,
//         "village": village,
//         "district": district,
//         "regency": regency,
//         "province": province,
//         "gambar": gambar,
//         "biaya": biaya,
//         "gunung": gunung.toJson(),
//       };
// }

// class GunungBooking {
//   final int id;
//   final String nama;
//   final double ketinggian;
//   final String province;

//   GunungBooking({
//     required this.id,
//     required this.nama,
//     required this.ketinggian,
//     required this.province,
//   });

//   factory GunungBooking.fromJson(Map<String, dynamic> json) {
//     return GunungBooking(
//       id: json['id'],
//       nama: json['nama'],
//       ketinggian: json['ketinggian'].toDouble(),
//       province: json['province'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nama": nama,
//         "ketinggian": ketinggian,
//         "province": province,
//       };
// }
