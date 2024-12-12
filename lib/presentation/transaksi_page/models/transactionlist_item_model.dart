import 'package:equatable/equatable.dart';

/// This class is used in the [transactionlist_item_widget] screen.
// ignore_for_file: must_be_immutable
class TransactionlistItemModel extends Equatable {
  TransactionlistItemModel({
    this.id,
    this.idPesanan,
    this.metodePembayaran,
    this.totalBayar,
    this.status,
    this.waktuPembayaran,
    this.bukti,
    this.gunung,
    this.jalur,
  });

  factory TransactionlistItemModel.fromJson(Map<String, dynamic> json) {
    return TransactionlistItemModel(
      id: json['id'],
      idPesanan: json['id_pesanan'],
      metodePembayaran: json['metode_pembayaran'],
      totalBayar: json['total_bayar'],
      status: json['status'],
      waktuPembayaran: json['waktu_pembayaran'],
      bukti: json['bukti'],
      gunung: json['gunung'],
      jalur: json['jalur'],
    );
  }

  String? id;
  int? idPesanan;
  String? metodePembayaran;
  int? totalBayar;
  String? status;
  String? waktuPembayaran;
  String? bukti;
  String? gunung;
  String? jalur;

  TransactionlistItemModel copyWith({
    String? id,
    int? idPesanan,
    String? metodePembayaran,
    int? totalBayar,
    String? status,
    String? waktuPembayaran,
    String? bukti,
    String? gunung,
    String? jalur,
  }) {
    return TransactionlistItemModel(
      id: id ?? this.id,
      idPesanan: idPesanan ?? this.idPesanan,
      metodePembayaran: metodePembayaran ?? this.metodePembayaran,
      totalBayar: totalBayar ?? this.totalBayar,
      status: status ?? this.status,
      waktuPembayaran: waktuPembayaran ?? this.waktuPembayaran,
      bukti: bukti ?? this.bukti,
      gunung: gunung ?? this.gunung,
      jalur: jalur ?? this.jalur,
    );
  }

  @override
  List<Object?> get props => [
        id,
        idPesanan,
        metodePembayaran,
        totalBayar,
        status,
        waktuPembayaran,
        bukti,
        gunung,
        jalur,
      ];
}
