class TransactionResponseModel {
  final String message;
  final TransactionModel transaction;

  TransactionResponseModel({
    required this.message,
    required this.transaction,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return TransactionResponseModel(
      message: json['message'],
      transaction: TransactionModel.fromJson(json['transaksi']),
    );
  }
}

class TransactionModel {
  final int id;
  final int idPesanan;
  final String metodePembayaran;
  final int totalBayar;
  final String statusPesanan;
  final String? waktuPembayaran;
  final String? bukti;

  TransactionModel({
    required this.id,
    required this.idPesanan,
    required this.metodePembayaran,
    required this.totalBayar,
    required this.statusPesanan,
    this.waktuPembayaran,
    this.bukti,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      idPesanan: json['id_pesanan'],
      metodePembayaran: json['metode_pembayaran'],
      totalBayar: json['total_bayar'],
      statusPesanan: json['status_pesanan'],
      waktuPembayaran: json['waktu_pembayaran'],
      bukti: json['bukti'],
    );
  }
}
