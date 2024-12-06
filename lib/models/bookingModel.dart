import 'dart:convert';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  bool success;
  String message;
  BookingModel data;

  Booking({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        success: json["success"],
        message: json["message"],
        data: BookingModel.fromJson(
            json["pesanan"]), // Adjusted to match 'pesanan'
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "pesanan": data.toJson(), // Adjusted to match 'pesanan'
      };
}

class BookingModel {
  final int id;
  final int idGunung;
  final int jalurId;
  final int userId;
  final DateTime tanggalNaik;
  final DateTime tanggalTurun;
  final List<Price> totalHargaTiket;
  final String status;
  final String createdAt;
  final String updatedAt;
  final List<dynamic> anggota;

  BookingModel({
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
    required this.anggota,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      idGunung: json['id_gunung'],
      jalurId: json['id_jalur'],
      userId: json['id_user'],
      tanggalNaik: DateTime.parse(json['tanggal_naik']),
      tanggalTurun: DateTime.parse(json['tanggal_turun']),
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      totalHargaTiket: (json["price"] as List)
          .map((price) => Price.fromJson(price))
          .toList(),
      anggota: List<dynamic>.from(
          json['anggota'] ?? []), // Assuming empty array if no anggota
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
      'total_harga_tiket': totalHargaTiket
          .map((price) => price.toJson())
          .toList(), // Convert list of Price to list of maps
      'anggota': anggota,
    };
  }
}

class Price {
  int jalurId;
  String priceFrom;
  String priceTo;

  Price({
    required this.jalurId,
    required this.priceFrom,
    required this.priceTo,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        jalurId: json["jalur_id"],
        priceFrom: Decimal.parse(json["price_from"]).toString(),
        priceTo: Decimal.parse(json["price_to"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "jalur_id": jalurId,
        "price_from": priceFrom,
        "price_to": priceTo,
      };
}
