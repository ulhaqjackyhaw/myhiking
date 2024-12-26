import 'package:equatable/equatable.dart';

/// This class is used in the [transactionlist_item_widget] screen.
// ignore_for_file: must_be_immutable
class TransactionlistItemModel extends Equatable {
  TransactionlistItemModel({
    this.id,
    this.pesananId,
    this.paymentId,
    this.status,
    this.waktuPembayaran,
    this.gunung,
    this.jalur,
    this.userId,
  });

  factory TransactionlistItemModel.fromJson(Map<String, dynamic> json) {
    return TransactionlistItemModel(
        id: json['id'],
        pesananId: json['id_pesanan'],
        paymentId: json['payment_id'],
        status: json['status'],
        waktuPembayaran: json['waktu_pembayaran'],
        gunung: json['gunung'],
        jalur: json['jalur'],
        userId: json['pemesan'].toString() //id pemesan
        );
  }

  String? id;
  int? pesananId;
  int? paymentId;
  String? status;
  String? waktuPembayaran;
  String? gunung;
  String? jalur;
  String? userId;

  TransactionlistItemModel copyWith({
    String? id,
    int? pesananId,
    int? paymentId,
    String? status,
    String? waktuPembayaran,
    String? gunung,
    String? jalur,
    String? userId,
  }) {
    return TransactionlistItemModel(
      id: id ?? this.id,
      pesananId: pesananId ?? this.pesananId,
      paymentId: paymentId ?? this.paymentId,
      status: status ?? this.status,
      waktuPembayaran: waktuPembayaran ?? this.waktuPembayaran,
      gunung: gunung ?? this.gunung,
      jalur: jalur ?? this.jalur,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        pesananId,
        paymentId,
        status,
        waktuPembayaran,
        gunung,
        jalur,
        userId,
      ];
}
