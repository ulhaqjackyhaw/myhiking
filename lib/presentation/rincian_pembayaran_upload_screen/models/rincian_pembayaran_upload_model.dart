import 'package:myhiking/models/bookingModel.dart';

class RincianPembayaranUploadModel {
  final int idPesanan;
  final double totalHargaTiket; // Total harga tiket
  final List<Anggota>? anggota; // List anggota (misalnya ID pengguna anggota)
  // final String? namaJalur; // Nama jalur
  // final String? namaGunung; // Nama gunung

  RincianPembayaranUploadModel({
    required this.idPesanan,
    required this.totalHargaTiket,
    this.anggota,
    // this.namaJalur,
    // this.namaGunung,
  });

  // Method untuk memparsing JSON ke objek RincianPembayaranUploadModel
  static RincianPembayaranUploadModel resPesananFromJson(Booking data) {
    // Ensure jalur and gunung are available from the data object
    return RincianPembayaranUploadModel(
      idPesanan: data.data.id,
      totalHargaTiket: data.data.totalHargaTiket.toDouble(),
      anggota: data.data.anggotaIds,
      // namaJalur: data.data.jalur != null
      //     ? data.data.jalur!.nama
      //     : null, // Access jalur safely
      // namaGunung: data.data.gunung != null
      //     ? data.data.gunung!.nama
      //     : null, // Access gunung safely
    );
  }

  // Method untuk mengkonversi objek ke format JSON
  Map<String, dynamic> toJson() {
    return {
      'id_pesanan': idPesanan,
      'total_harga_tiket': totalHargaTiket,
      'anggota': anggota?.map((anggota) => anggota.toJson()).toList(),
      // 'nama_jalur': namaJalur, // Menyertakan nama jalur
      // 'nama_gunung': namaGunung, // Menyertakan nama gunung
    };
  }
}
