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

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        success: json["success"],
        message: json["message"],
        data: ModelBooking.fromJson(
            json["pesanan"]), // Adjusted to match 'pesanan'
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "pesanan": data.toJson(), // Adjusted to match 'pesanan'
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
    this.anggotaIds, // AnggotaIds bersifat opsional
  });

  factory ModelBooking.fromJson(Map<String, dynamic> json) {
    // var anggotaList = json['anggota_ids'] != null
    //     ? List<Anggota>.from(
    //         json['anggota_ids'].map((item) => Anggota.fromJson(item)))
    //     : null;
    // print("Anggota IDs: ${json['anggota_ids']}");
    return ModelBooking(
      id: json['id'],
      idGunung: json['id_gunung'],
      jalurId: json['id_jalur'],
      userId: json['id_user'],
      tanggalNaik: json['tanggal_naik'] != null
          ? DateTime.parse(json['tanggal_naik'])
          : DateTime.now(),
      tanggalTurun: json['tanggal_turun'] != null
          ? DateTime.parse(json['tanggal_turun'])
          : DateTime.now(),
      status: json['status'] ?? '', // Default empty string if null
      createdAt: json['created_at'] ?? '', // Default empty string if null
      updatedAt: json['updated_at'] ?? '', // Default empty string if null
      // totalHargaTiket: (json["price"] as List)
      //     .map((price) => Price.fromJson(price))
      //     .toList(),
      totalHargaTiket: json['total_harga_tiket'],
      anggotaIds: json['anggota_ids'] != null && json['anggota_ids'] is List
          ? (json['anggota_ids'] as List)
              .map((item) => Anggota.fromJson(item))
              .toList()
          : [], // Return an empty list if anggota_ids is null or not a list
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
      // 'total_harga_tiket': totalHargaTiket
      //     .map((price) => price.toJson())
      //     .toList(), // Convert list of Price to list of maps
      'total_harga_tiket': totalHargaTiket,
      'anggota_ids': anggotaIds != null
          ? anggotaIds!.map((anggota) => anggota.toJson()).toList()
          : [], // Mengirim anggotaIds sebagai list kosong jika null // Jika anggotaIds null, kirim list kosong
    };
  }
}

// class Price {
//   int jalurId;
//   String priceFrom;
//   String priceTo;

//   Price({
//     required this.jalurId,
//     required this.priceFrom,
//     required this.priceTo,
//   });

//   factory Price.fromJson(Map<String, dynamic> json) => Price(
//         jalurId: json["jalur_id"],
//         priceFrom: Decimal.parse(json["price_from"]).toString(),
//         priceTo: Decimal.parse(json["price_to"]).toString(),
//       );

//   Map<String, dynamic> toJson() => {
//         "jalur_id": jalurId,
//         "price_from": priceFrom,
//         "price_to": priceTo,
//       };
// }

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
